// Code your testbench here
// or browse Examples
module traffic_control_tb;

  wire [2:0] green_ns,yellow_ns,red_ns,green_ew,yellow_ew,red_ew;
  reg clk,rst_a;

  traffic_control DUT (green_ns,yellow_ns,red_ns,green_ew,yellow_ew,red_ew,clk,rst_a);

initial
 begin

  clk=1'b1;
  forever #5 clk=~clk;

 end
 
initial 
  begin
        // Dump waves
  $dumpfile("dump.vcd");
  $dumpvars(1 , traffic_control_tb);
  	rst_a=1'b1;
  	#15;
  	rst_a=1'b0;
  	#1000;
    $stop;
  end
endmodule
