/******************************************************************************/
/*                                                                            */
/* main.c -- Demo project for the PmodOLED IP                                 */
/*                                                                            */
/******************************************************************************/
/* Author: Arthur Brown                                                       */
/* Copyright 2016, Digilent Inc.                                              */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This demo_project initializes and uses the PmodOLED to display strings     */
/* and show different available fill patterns.                                */
/*                                                                            */
/* In order to properly quit the demo, a serial terminal application should   */
/* be connected to your board over UART at the appropriate Baud rate, as      */
/* specified below.                                                           */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*                                                                            */
/*    06/20/2016(ArtVVB):   Created                                           */
/*    12/15/2016(jPeyron):  Edited for better use for OnboardOLED in, as well */
/*                          as inverting the white and black                  */
/*    08/25/2017(ArtVVB):   Added proper cache management functions           */
/*    02/17/2018(atangzwj): Validated for Vivado 2017.4                       */
/*                                                                            */
/******************************************************************************/
/* Baud Rates:                                                                */
/*                                                                            */
/*    Microblaze: 9600 or what was specified in UARTlite core                 */
/*    Zynq: 115200                                                            */
/*                                                                            */
/******************************************************************************/

/* ------------------------------------------------------------ */
/*                  Include File Definitions                    */
/* ------------------------------------------------------------ */

#include <stdio.h>
#include "PmodAMP2.h"
#include "PmodOLED.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "PmodGYRO.h"
#include "time.h"

#ifdef __MICROBLAZE__
   #include "xintc.h"

   #define INTC                  XIntc
   #define INTC_HANDLER          XIntc_InterruptHandler
   #define INTC_DEVICE_ID        XPAR_INTC_0_DEVICE_ID
   #define INTC_TMR_INTERRUPT_ID XPAR_INTC_0_PMODAMP2_0_VEC_ID
#else
   #include "xscugic.h"
   #include "xil_exception.h"

   #define INTC                  XScuGic
   #define INTC_HANDLER          Xil_InterruptHandler
   #define INTC_DEVICE_ID        XPAR_PS7_SCUGIC_0_DEVICE_ID
   #define INTC_TMR_INTERRUPT_ID XPAR_FABRIC_PMODAMP2_0_TIMER_INTERRUPT_INTR
#endif

#define PWM_BASEADDR   XPAR_PMODAMP2_0_AXI_LITE_PWM_BASEADDR
#define GPIO_BASEADDR  XPAR_PMODAMP2_0_AXI_LITE_GPIO_BASEADDR
#define TIMER_BASEADDR XPAR_PMODAMP2_0_AXI_LITE_TIMER_BASEADDR

/* ------------------------------------------------------------ */
/*                  Global Variables                            */
/* ------------------------------------------------------------ */

PmodOLED myDevice1;
PmodGYRO myDevice2;

INTC intc;
PmodAMP2 amp;
u32 delta = 0;
u32 duty  = 0;
u8 rise   = 0;
/* ------------------------------------------------------------ */
/*                  Forward Declarations                        */
/* ------------------------------------------------------------ */

void DemoInitialize();
void DemoRun();
void DemoCleanup();
void EnableCaches();
void DisableCaches();
int  DemoIntcInitialize(PmodAMP2 *InstancePtr, INTC *IntcInstancePtr,
      u16 IntcDeviceId, u32 InterruptId, void *Handler);
void DemoInterruptHandler(PmodAMP2 *InstancePtr);
void DemoSetFrequency(u32 freq_hz);

// To change between PmodOLED and OnBoardOLED is to change Orientation
const u8 orientation = 0x0; // Set up for Normal PmodOLED(false) vs normal
                            // Onboard OLED(true)
const u8 invert = 0x0; // true = whitebackground/black letters
                       // false = black background /white letters

/* ------------------------------------------------------------ */
/*                  Function Definitions                        */
/* ------------------------------------------------------------ */

int main() {
   DemoInitialize();
   DemoRun();
   DemoCleanup();

   return 0;
}
void DemoSetFrequency(u32 freq_hz) {
   delta = (freq_hz * (2.0 * AMP2_PWM_PERIOD * AMP2_PWM_PERIOD / 100000000));
}
void DemoInterruptHandler(PmodAMP2 *InstancePtr) {
   if (XTmrCtr_IsExpired(&InstancePtr->timer, 0)) {
      XTmrCtr_Stop(&InstancePtr->timer, 0);

      // Draw a triangle wave
      if (rise == 0) {
         if (duty + delta <= AMP2_PWM_PERIOD) {
            duty = duty + delta;
         } else {
            duty = (AMP2_PWM_PERIOD << 1) - duty - delta;
            rise = 1;
         }
      } else {
         if (duty >= delta) {
            duty = duty - delta;
         } else {
            duty = delta - duty;
            rise = 0;
         }
      }

      PWM_Disable(InstancePtr->PWM_BaseAddress);
      PWM_Set_Duty(InstancePtr->PWM_BaseAddress, duty, 0);
      PWM_Enable(InstancePtr->PWM_BaseAddress);
      XTmrCtr_Reset(&InstancePtr->timer, 0);
      XTmrCtr_Start(&InstancePtr->timer, 0);
   }
}

int DemoIntcInitialize(PmodAMP2 *InstancePtr, INTC *IntcInstancePtr,
      u16 IntcDeviceId, u32 InterruptId, void *Handler) {
   int status;
#ifdef __MICROBLAZE__
   /*
    * Initialize the interrupt controller driver so that it's ready to use.
    * specify the device ID that was generated in xparameters.h
    */
   status = XIntc_Initialize(IntcInstancePtr, InterruptId);
   if (status != XST_SUCCESS)
      return status;

   /* Hook up interrupt service routine */
   XIntc_Connect (
      IntcInstancePtr,
      InterruptId,
      (Xil_ExceptionHandler) Handler,
      InstancePtr
   );

   /* Enable the interrupt vector at the interrupt controller */
   XIntc_Enable(IntcInstancePtr, InterruptId);

   /*
    * Start the interrupt controller such that interrupts are recognized
    * and handled by the processor
    */
   status = XIntc_Start(IntcInstancePtr, XIN_REAL_MODE);
   if (status != XST_SUCCESS)
      return status;

   /*
    * Initialize the exception table and register the interrupt
    * controller handler with the exception table
    */
   Xil_ExceptionInit();

   Xil_ExceptionRegisterHandler (
      XIL_EXCEPTION_ID_INT,
      (Xil_ExceptionHandler) INTC_HANDLER,
      IntcInstancePtr
   );

   /* Enable non-critical exceptions */
   Xil_ExceptionEnable();
#else
   XScuGic_Config *IntcCfgPtr;

   XTmrCtr_SetHandler (
      &InstancePtr->timer,
      (XTmrCtr_Handler) Handler,
      &InstancePtr
   );

   Xil_ExceptionRegisterHandler (
      XIL_EXCEPTION_ID_INT,
      (Xil_ExceptionHandler) XScuGic_InterruptHandler,
      IntcInstancePtr
   );
   Xil_ExceptionEnable();

   // Interrupt controller initialization
   IntcCfgPtr = XScuGic_LookupConfig(IntcDeviceId);
   status = XScuGic_CfgInitialize (
      IntcInstancePtr,
      IntcCfgPtr,
      IntcCfgPtr->CpuBaseAddress
   );

   if(status != XST_SUCCESS)
      return status;

   // Connect timer interrupt to handler
   status = XScuGic_Connect (
      IntcInstancePtr,
      InterruptId,
      Handler,
      InstancePtr
   );

   if(status != XST_SUCCESS)
      return status;

   // Enable Interrupts
   XScuGic_Enable (
      IntcInstancePtr,
      InterruptId
   );
#endif

   return XST_SUCCESS;

}

void sound(int freq){
	 DemoSetFrequency(freq);
	   AMP2_start(&amp);

	   xil_printf("started PmodAMP2 Demo\n\r");

	   while (1) {
	      DemoSetFrequency(freq);
	      sleep(1);
	      DemoSetFrequency(freq);
	      sleep(1);
	   }

	   AMP2_stop(&amp);
}

void DemoInitialize() {
   EnableCaches();
   OLED_Begin(&myDevice1, XPAR_PMODOLED_0_AXI_LITE_GPIO_BASEADDR,
         XPAR_PMODOLED_0_AXI_LITE_SPI_BASEADDR, orientation, invert);
   GYRO_begin(&myDevice2, XPAR_PMODGYRO_0_AXI_LITE_SPI_BASEADDR,
            XPAR_PMODGYRO_0_AXI_LITE_GPIO_BASEADDR);

      // Set Threshold Registers
      GYRO_setThsXH(&myDevice2, 0x0F);
      GYRO_setThsYH(&myDevice2, 0x0F);
      GYRO_setThsZH(&myDevice2, 0x0F);

      GYRO_enableInt1(&myDevice2, GYRO_INT1_XHIE);    // Threshold interrupt
      GYRO_enableInt2(&myDevice2, GYRO_REG3_I2_DRDY); // Data Rdy/FIFO interrupt

      XStatus status;
      AMP2_begin(&amp, PWM_BASEADDR, GPIO_BASEADDR, TIMER_BASEADDR);
      status = DemoIntcInitialize (
            &amp,
            &intc,
            INTC_DEVICE_ID,
            INTC_TMR_INTERRUPT_ID,
            (Xil_ExceptionHandler) DemoInterruptHandler
         );

         if (status != XST_SUCCESS)
            xil_printf("intc setup failed\n\r");

}

unsigned int xorshift32(unsigned int state){
	state^=state<<13;
	state^=state>>17;
	state^=state<<5;
	return state;
}

const char* note_string(int string){
	static char *x[10];
	switch(string){
	case 262:
		strcpy(x,"262 C ");
		break;
	case 277:
		strcpy(x,"277 C# ");
		break;
	case 294:
		strcpy(x,"294 D");
		break;
	case 311:
		strcpy(x,"311 D# ");
		break;
	case 330:
		strcpy(x,"330 E ");
		break;
	case 349:
		strcpy(x,"349 F");
		break;
	case 370:
		strcpy(x,"370 F#");
		break;
	case 392:
		strcpy(x,"392 G ");
		break;
	case 415:
		strcpy(x,"415 G# ");
		break;
	case 440:
		strcpy(x,"440 A ");
		break;
	default:
		break;
	}
	return x;
}

void DemoRun() {
	//oled vars
   u8 *pat;
   char c;
   //261

   //gyro vars
   int16_t xAxis = 0;
      int16_t yAxis = 0;
      int trig = 0;

   xil_printf("UART and SPI opened for PmodOLED Demo\n\r");
   int frequency[] = {262,277,294,311,330,349, 370, 392,415,440};
   int target_idx,begin_idx;

//   target_idx = rand() % 10;
   unsigned int seed = 12345;
   seed=xorshift32(seed);
   target_idx = seed%10;
   seed=xorshift32(seed);
   begin_idx = seed%10;
   while(begin_idx == target_idx){
//	   begin_idx = rand() % 10;
	   seed=xorshift32(seed);
	   begin_idx = seed%10;
   }
   int timer = 3000000;
   int result[10] = {0,0,0,0,0,0,0,0,0,0};
   int trial = 0;
   while (1) {
	   //gyro
	   //usleep(500000);
	         if (GYRO_Int1Status(&myDevice2) != 0) {
	            xil_printf("\x1B[2J");
	            xil_printf("\x1B[H");
	            xil_printf("Threshold reached\n\r");
	            trig = 1;
	         }
	         if (GYRO_Int2Status(&myDevice2) != 0) {
	            if (trig == 1) {
	               trig = 0;
	            } else {
	               xil_printf("\x1B[2J"); // Clear screen
	               xil_printf("\x1B[H");  // Reset cursor to 0,0
	            }
	            xil_printf("Data is ready\n\r\n\r");
	         }
	   //oled
      xil_printf("entering loop\r\n");
      // Choosing Fill pattern 0
      pat = OLED_GetStdPattern(0);
      OLED_SetFillPattern(&myDevice1, pat);
      // Turn automatic updating off
      OLED_SetCharUpdate(&myDevice1, 1);
      xil_printf("target: %d, current: %d,", frequency[target_idx], frequency[begin_idx]);
      xil_printf("begin idx: %d\n\r", begin_idx);
      // Draw a rectangle over writing then slide the rectangle down slowly
      // displaying all writing
      	  xAxis = GYRO_getX(&myDevice2);
    	  yAxis = GYRO_getY(&myDevice2);
    	  int freqs = frequency[begin_idx];
    	 char freq[] = "Current: ";
    	 const char* x = note_string(frequency[begin_idx]);
    	 xil_printf("%s\n\r", x);
    	 strcat(freq,x);

    	 OLED_ClearBuffer(&myDevice1);
         OLED_SetCursor(&myDevice1, 0, 0);
         OLED_PutString(&myDevice1, freq);
         OLED_SetCursor(&myDevice1, 0, 1);
         char time[] = "Time left: ";
         sprintf(x, "%d", timer/1000000);
         strcat(time,x);
         xil_printf("timer: %d", timer);
         OLED_PutString(&myDevice1, time);

         OLED_SetCursor(&myDevice1, 0, 2);


         //box length 12, separation 2, total trial 10
         if(yAxis > 15000){
        	 begin_idx-=1;
        	 if(begin_idx < 0){
        		 begin_idx = 0;
        	 }
         }else if(xAxis > 15000){
        	 begin_idx+=1;
        	 if(begin_idx > 9){
        		 begin_idx = 9;
        	 }
         }

         if(timer <= 0){

        	 if(begin_idx == target_idx){

        		 result[trial] = 1;
        		 DemoSetFrequency(freqs);
        		 AMP2_start(&amp);
        		 xil_printf("started PmodAMP2 Demo\n\r");
				 DemoSetFrequency(freqs);
				 sleep(1);
				 AMP2_stop(&amp);

        	 }else{

        		 DemoSetFrequency(freqs);
        		 AMP2_start(&amp);
        		 xil_printf("started PmodAMP2 Demo\n\r");
        		 DemoSetFrequency(freqs);
        		 sleep(1);
        		 AMP2_stop(&amp);
        	 }

        	 trial+=1;
        	 timer = 3000000;
        	 seed=xorshift32(seed);
        	 target_idx = seed%10;
        	 seed=xorshift32(seed);
        	 begin_idx = seed%10;
        	 while(begin_idx == target_idx){
        //	   begin_idx = rand() % 10;
        	 	seed=xorshift32(seed);
        	 	begin_idx = seed%10;
        	 }
         }

         for(int i = 0; i < 10; i++){
        	 int start = 12*i;
        	 int end = start+12;
        	 if(result[i]){
        		 pat = OLED_GetStdPattern(1);
        		 		 OLED_SetFillPattern(&myDevice1, pat);
        		          OLED_MoveTo(&myDevice1, end, 20);
        		          OLED_FillRect(&myDevice1, start, 30);
        		 OLED_DrawRect(&myDevice1, start, 30);
        	 }else{
        		 pat = OLED_GetStdPattern(7);
        		 	     OLED_SetFillPattern(&myDevice1, pat);
        		 	     OLED_MoveTo(&myDevice1, end, 20);
        		 		 OLED_FillRect(&myDevice1, start, 30);
        		 		 OLED_DrawRect(&myDevice1, start, 30);
        	 }
         }
         OLED_Update(&myDevice1);
         DemoSetFrequency(freqs);
		 AMP2_start(&amp);
		 xil_printf("started PmodAMP2 Demo\n\r");
		 DemoSetFrequency(freqs);
		 usleep(100000);
		 AMP2_stop(&amp);
         timer-=100000;
         if(trial>10){
        	 break;
         }


#ifdef __MICROBLAZE__
      c = 'q';
#else
      xil_printf("(q)uit or any key to continue:\n\r");
      c = inbyte();
#endif

   }
   xil_printf("Exiting PmodOLED Demo\n\r");
}


void DemoCleanup() {
   OLED_End(&myDevice1);
   GYRO_end(&myDevice2);
   DisableCaches();
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}
