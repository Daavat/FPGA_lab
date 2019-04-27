

module trafficlight_controller(
    input  wire clk,
  
    output reg green_ns,    // green_ns, yello_ns, red_ns, green_ew, yello_ew, red_ew, g are the final outputs.
    output reg yello_ns,
    output reg red_ns,
    output reg green_ew,
    output reg yello_ew,
    output reg red_ew  
);

reg P;          //to store the present and past state information
reg Q;
reg R;
reg K; 
reg L;
reg M;

  reg [30:0] delay;       

  initial begin        //initializing 
    K<=0;
    L<=0;
    M<=0;
    end

always @(posedge clk) begin
  
  
  green_ns=(R&!Q&P);                              //boolean relation for corresponding outputs
  yello_ns=(R&!Q&!P);
  red_ns=(!R&!Q&!P)|(!R&!Q&P)|(!R&Q&!P)|(!R&Q&P);
  green_ew=(!R&Q&!P);
  yello_ew=(!R&!Q&P);
  red_ew=(!R&!Q&!P)|(!R&Q&P)|(R&!Q&!P)|(R&!Q&P);
  
  P<=(!K);                                      //update function
  Q<=((L&K)|(M&!K));
  R<=(M&K)|(!M&!L&!K);
	
  
  
  delay = delay+1;
      
if(delay == 29'b10111110101111000010000000000 & (R == 1 & Q == 0 & P == 1)) 
	begin
              
	delay=27'b0;
	K<=P;
	L<=Q;
	M<=R;
               
	end
//400000000 - delay     

else if(delay == 29'b10111110101111000010000000000 & (R == 0 & Q == 1 & P == 0))
	begin
              
	delay=27'b0;
	K<=P;
	L<=Q;
	M<=R;
               
	end

//400000000 - delay

else if(delay == 29'b10001111000011010001100000000 & (R == 1 & Q == 0 & P == 0))
	begin
              
	delay=27'b0;
	K<=P;
	L<=Q;
	M<=R;
               
	end

//300000000 - delay

else if(delay == 28'b1011111010111100001000000000 & (R == 0 & Q == 1 & P == 1))
	begin
              
	delay=27'b0;
	K<=P;
	L<=Q;
	M<=R;
               
	end

//200000000 - delay

else if(delay == 29'b10001111000011010001100000000 & (R == 0 & Q == 0 & P == 1))
	begin
              
	delay=27'b0;
	K<=P;
	L<=Q;
	M<=R;
               
	end
//300000000 - delay

else if(delay == 28'b1011111010111100001000000000 & (R == 0 & Q == 0 & P == 0))
	begin
              
	delay=27'b0;
	K<=P;
	L<=Q;
	M<=R;
               
	end

//200000000	- delay

end

endmodule


