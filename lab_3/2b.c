#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include <stdbool.h>

#include "PmodKYPD.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xparameters.h"

void DemoInitialize();
u8 DemoRun();
void DemoCleanup();
void DisableCaches();
void EnableCaches();
void DemoSleep(u32 millis);

void to_input(int x, char* input);
int game(int x, int y);
void generate_result(int keyboard, int keypad, char* result);

PmodKYPD myDevice;

int main(void) {
   DemoInitialize();

   // get keyboard input
   char c1;
   c1 = getchar();
   int keyboard = c1 - '0';

   char c2 = (char)DemoRun();
   int keypad = c2 - '0';

   xil_printf("keyboard input: %d", keyboard);
   xil_printf("keypad input: %d", keypad);

   DemoCleanup();
   return 0;
}

void to_input(int x, char* input){
	if(x == 1)
		input = "rock";
	else if(x == 2)
		input = "paper";
	else if(x == 3)
		input = "scissors";
	else
		input = "invalid";
}

/**
 * 0 for x wins, 1 for y wins, 2 for a draw
 */
int game(int x, int y){
	if(x == y){
		return 2;
	}
	if((x==1 && y==3)||(x==2 && y==1)||(x==3 && y==2)){
		return 0;
	}
	else{
		return 1;
	}
}

void generate_result(int keyboard, int keypad, char* result){
	char pc[] = "PC won! ";
	char fpga[] = "FPGA won! ";
	char draw[] = "Draw! ";
	char op[2] = "";

	int winner = game(keyboard, keypad);

	if(winner == 0){
		strcat(result, pc);
		strcpy(op, ">");
	}
	else if(winner == 1){
		strcat(result, fpga);
		strcpy(op, "<");
	}
	else if(winner == 2){
		strcat(result, draw);
		strcpy(op, "=");
	}

	char pc_input[10];
	char fpga_input[10];
	to_input(keyboard, pc_input);
	to_input(keypad, fpga_input);

	strcat(result, pc_input);
	strcat(result, op);
	strcat(result, fpga_input);

}

// keytable is determined as follows (indices shown in Keypad position below)
// 12 13 14 15
// 8  9  10 11
// 4  5  6  7
// 0  1  2  3
#define DEFAULT_KEYTABLE "0FED789C456B123A"

void DemoInitialize() {
   EnableCaches();
   KYPD_begin(&myDevice, XPAR_PMODKYPD_0_AXI_LITE_GPIO_BASEADDR);
   KYPD_loadKeyTable(&myDevice, (u8*) DEFAULT_KEYTABLE);
}

u8 DemoRun() {
   u16 keystate;
   XStatus status, last_status = KYPD_NO_KEY;
   u8 key, last_key = 'x';
   // Initial value of last_key cannot be contained in loaded KEYTABLE string

   Xil_Out32(myDevice.GPIO_addr, 0xF);

   xil_printf("Pmod KYPD demo started. Press any key on the Keypad.\r\n");
   while (1) {
      // Capture state of each key
      keystate = KYPD_getKeyStates(&myDevice);

      // Determine which single key is pressed, if any
      status = KYPD_getKeyPressed(&myDevice, keystate, &key);

      // Print key detect if a new key is pressed or if status has changed
      if (status == KYPD_SINGLE_KEY
            && (status != last_status || key != last_key)) {
    	 return key;
//         xil_printf("Key Pressed: %c\r\n", (char) key);
         last_key = key;
      } else if (status == KYPD_MULTI_KEY && status != last_status)
         xil_printf("Error: Multiple keys pressed\r\n");

      last_status = status;

      usleep(1000);
   }
   return 'x';
}

void DemoCleanup() {
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
