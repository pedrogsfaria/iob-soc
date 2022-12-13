`timescale 1ns / 1ps
`include "system.vh"

module top_system(
	          input  clk,
	          input  reset,

	          //uart
	          output uart_txd,
	          input  uart_rxd,

		  //gpio
		  input gpio_input,		  
		  output [1:0] gpio_output,
		  output t_led
		  
		  );

   //
   // RESET MANAGEMENT
   //

   //assign gpio_input = {31'b0,sw};
   //devise method to slice output   
   assign t_led= 1;     

   //system reset     

   wire                         sys_rst;

   reg [15:0] 			rst_cnt;
   reg                          sys_rst_int;

   always @(posedge clk, posedge reset)
     if(reset) begin
        sys_rst_int <= 1'b0;
        rst_cnt <= 16'hFFFF;
     end else begin
        if(rst_cnt != 16'h0)
          rst_cnt <= rst_cnt - 1'b1;
        sys_rst_int <= (rst_cnt != 16'h0);
     end

   assign sys_rst = sys_rst_int;

   //
   // SYSTEM
   //
   system system
     (
      .clk           (clk),
      .rst           (sys_rst),
      .trap          (trap),

      //UART
      .uart_txd      (uart_txd),
      .uart_rxd      (uart_rxd),
      .uart_rts      (),
      .uart_cts      (1'b1),

      //GPIO
      .gpio_input (gpio_input),
      .gpio_output (gpio_output)      
      );

endmodule
