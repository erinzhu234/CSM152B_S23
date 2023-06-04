/* ------------------------------------------------------------ */
/*                  Include File Definitions                    */
/* ------------------------------------------------------------ */

#include <stdio.h>
#include "PmodOLED.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "PmodJSTK.h"

/* ------------------------------------------------------------ */
/*                  Global Variables                            */
/* ------------------------------------------------------------ */
#ifdef __MICROBLAZE__
#define CPU_CLOCK_FREQ_HZ (XPAR_CPU_CORE_CLOCK_FREQ_HZ)
#else
#define CPU_CLOCK_FREQ_HZ (XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ)
#endif

PmodJSTK joystick;
PmodOLED oled;
/* ------------------------------------------------------------ */
/*                  Forward Declarations                        */
/* ------------------------------------------------------------ */

void Initialize();
void GameRun();
void Cleanup();
void EnableCaches();
void DisableCaches();

// To change between PmodOLED and OnBoardOLED is to change Orientation
const u8 orientation = 0x0; // Set up for Normal PmodOLED(false) vs normal
                            // Onboard OLED(true)
const u8 invert = 0x0; // true = whitebackground/black letters
                       // false = black background /white letters

/* ------------------------------------------------------------ */
/*                  Function Definitions                        */
/* ------------------------------------------------------------ */

int main() {
   Initialize();
   GameRun();
   Cleanup();

   return 0;
}

void Initialize() {
    EnableCaches();
    OLED_Begin(&oled, XPAR_PMODOLED_0_AXI_LITE_GPIO_BASEADDR,
        XPAR_PMODOLED_0_AXI_LITE_SPI_BASEADDR, orientation, invert);
    JSTK_begin(
        &joystick,
        XPAR_PMODJSTK_0_AXI_LITE_SPI_BASEADDR,
        XPAR_PMODJSTK_0_AXI_LITE_GPIO_BASEADDR
    );
}


void GameRun() {
    //oled vars
    int irow, ib, i;
    u8 *pat;
    char c;
    //261 - 523

    //jstk vars
    JSTK_DataPacket rawdata;

    while (1) {

        rawdata = JSTK_getDataPacket(&joystick);


        // Choosing Fill pattern 0
        pat = OLED_GetStdPattern(0);
        OLED_SetFillPattern(&oled, pat);
        // Turn automatic updating off
        OLED_SetCharUpdate(&oled, 1);

        char x_str[] = "x axis: ";
        char y_str[] = "y axis: ";
        char x_pos[10];
        char y_pos[10];
        sprintf(x_pos, "%d", rawdata.XData);
        sprintf(y_pos, "%d", rawData.YData);
        strcat(x_str, x_pos);
        strcat(y_str, y_pos);

        OLED_ClearBuffer(&oled);
        OLED_SetCursor(&oled, 0, 0);
        OLED_PutString(&oled, x_str);
        OLED_SetCursor(&oled, 0, 1);
        OLED_PutString(&oled, y_str);

        pat = OLED_GetStdPattern(1);
        OLED_SetFillPattern(&oled, pat);
        OLED_MoveTo(&oled, 0, 20);
        OLED_FillRect(&oled, 10, 30);
        OLED_DrawRect(&oled, 10, 30);

        pat = OLED_GetStdPattern(7);
        OLED_SetFillPattern(&oled, pat);
        OLED_MoveTo(&oled, 10, 20);
        OLED_FillRect(&oled, 128, 30);
        OLED_DrawRect(&oled, 128, 30);

        OLED_Update(&oled);
        usleep(100000);
    }

}

void Cleanup() {
   OLED_End(&oled);
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
