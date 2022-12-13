#include "system.h"
#include "periphs.h"
#include "iob-uart.h"
#include "iob-gpio.h"
#include "printf.h"

char *send_string = "Sending this string as a file to console.\n"
                    "The file is then requested back from console.\n"
                    "The sent file is compared to the received file to confirm " 
                    "correct file transfer via UART using console.\n"
                    "Generating the file in the firmware creates an uniform "
                    "file transfer between pc-emul, simulation and fpga without"
                    " adding extra targets for file generation.\n";

// copy src to dst
// return number of copied chars (excluding '\0')
int string_copy(char *dst, char *src) {
    if (dst == NULL || src == NULL) {
        return -1;
    }
    int cnt = 0;
    while(src[cnt] != 0){
        dst[cnt] = src[cnt];
        cnt++;
    }
    dst[cnt] = '\0';
    return cnt;
}

// 0: same string
// otherwise: different
int compare_str(char *str1, char *str2, int str_size) {
    int c = 0;
    while(c < str_size) {
        if (str1[c] != str2[c]){
            return str1[c] - str2[c];
        }
        c++;
    }
    return 0;
}

int main() {

  /* ******************* Init section ******************* */ 
  //init uart
  uart_init(UART_BASE,FREQ/BAUD);

  //test puts
  /*uart_puts("\n\n\nHello world!\n\n\n");

  //test printf with floats 
  printf("Value of Pi = %f\n\n", 3.1415);

  //test file send
  char *sendfile = malloc(1000);
  int send_file_size = 0;
  send_file_size = string_copy(sendfile, send_string);
  uart_sendfile("Sendfile.txt", send_file_size, sendfile);

  //test file receive
  char *recvfile = malloc(10000);
  int file_size = 0;
  file_size = uart_recvfile("Sendfile.txt", recvfile);

  //compare files
  if (compare_str(sendfile, recvfile, send_file_size)) {
      printf("FAILURE: Send and received file differ!\n");
  } else {
      printf("SUCCESS: Send and received file match!\n");
  }
  free(sendfile);
  free(recvfile);*/
  
  
  /* ******************* Lab 2 - Fibonacci ******************* */
  /*printf("Lab 2 - Fibonacci Sequence:\n");
  
  uint32_t f, f0 = 0;
  uint32_t f1 = 1;
  
  // F0
  printf("%d\n", f0);
  
  // F1
  printf("%d\n", f1);
  
  // Fibonacci cycle
  for(int n = 2; n < 47; n++) {

    f = f0 + f1;	// Fn = F(n-1) + F(n-2)
    f0 = f1;		// F(n-1)
    f1 = f;	       	// F(n-2)

    printf("%d\n", f);    
	  
    }*/

  /* ******************* Lab 3 - GPIO ******************* */
  printf("\n\nLab 3 - GPIO:\n\n");
  uint32_t g_input = 0;

  // Submodule init
  gpio_init(GPIO_BASE);
  gpio_set_output_enable(0x03);  // Set output pin gpio[1] and gpio[2] for LED 1 and 2

  printf("LED 1 ON\n\n");
  gpio_set(0x01);                // Turn LED 1 ON
    
  printf("Waiting for switch\n");  
  while(!(g_input & 0x01)) {
    g_input = gpio_get();
  }

  printf("Switch ON: LED 1 OFF and LED 2 ON\n");
  gpio_set(0x02);                // Turn LED 1 OFF an LED 2 ON
  
  printf("\n\n");
    
  /* ******************* End section ******************* */
  uart_finish();
  
}
