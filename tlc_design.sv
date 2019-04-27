module traffic_control(green_ns,yellow_ns,red_ns,green_ew,yellow_ew,red_ew,clk,rst_a);

  output reg [2:0] green_ns,yellow_ns,red_ns,green_ew,yellow_ew,red_ew; 
   input      clk;
   input      rst_a;
  
   reg [2:0] state;
  
  
  parameter [2:0] S0 = 3'b000;
  parameter [2:0] S1 = 3'b001;
  parameter [2:0] S2 = 3'b010;
  parameter [2:0] S3 = 3'b011;
  parameter [2:0] S4 = 3'b100;
  parameter [2:0] S5 = 3'b101;
  
  reg [4:0] count;
  
  always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
                state = S0;
                count = 4'b0000;
            end
        else
            begin
                case (state)
                S0:
                    begin
                      if( count == 4'b1111)
                            begin
                            count = 4'b0000;
                            state = S1;
                            end
                        else
                            begin
                            count = count + 4'b0001;
                            state = S0;
                            end
                    end
                S1:
                    begin
                      if( count == 4'b0011)
                            begin
                            count = 4'b0000;
                            state = S2;
                            end
                        else
                            begin
                            count = count + 4'b0001;
                            state = S1;
                            end
                    end
                S2:
                    begin
                      if( count == 4'b0011)
                            begin
                            count = 4'b0000;
                            state = S3;
                            end
                        else
                            begin
                            count = count + 4'b0001;
                            state = S2;
                            end
                    end
                  
                S3:
                    begin
                      if( count == 4'b1111)
                            begin
                            count = 4'b0000;
                            state = S4;
                            end
                        else
                            begin
                            count = count + 4'b0001;
                            state = S3;
                            end
                    end
                  
                S4:
                    begin
                      if( count == 4'b0011)
                            begin
                            count = 4'b0000;
                            state = S5;
                            end
                        else
                            begin
                            count = count + 4'b0001;
                            state = S4;
                            end
                    end
                  
                S5:
                    begin
                      if( count == 4'b0011)
                            begin
                            count = 4'b0000;
                            state = S0;
                            end
                        else
                            begin
                            count = count + 4'b0001;
                            state = S5;
                            end
                    end
               
           		endcase
       		end
     end
 always @(state)
     begin
         case (state)
            S0 :
                begin
                    green_ns = 3'b001;
                    yellow_ns = 3'b000;
                    red_ns = 3'b000;
                    green_ew = 3'b000;
                  	yellow_ew = 3'b000;
                  	red_ew = 3'b001;
                end //state S0

            S1 :
                begin
                    green_ns = 3'b000;
                    yellow_ns = 3'b001;
                    red_ns = 3'b000;
                    green_ew = 3'b000;
                  	yellow_ew = 3'b000;
                  	red_ew = 3'b001;
                end // state: S1

            S2 :
                begin
                    green_ns = 3'b000;
                    yellow_ns = 3'b000;
                    red_ns = 3'b001;
                    green_ew = 3'b000;
                  	yellow_ew = 3'b000;
                  	red_ew = 3'b001;
                end // state: S2

            S3 :
                begin
                    green_ns = 3'b000;
                    yellow_ns = 3'b000;
                    red_ns = 3'b001;
                    green_ew = 3'b001;
                  	yellow_ew = 3'b000;
                  	red_ew = 3'b000;
                end // state: S3

            S4 :
                begin
                    green_ns = 3'b000;
                    yellow_ns = 3'b000;
                    red_ns = 3'b001;
                    green_ew = 3'b000;
                  	yellow_ew = 3'b001;
                  	red_ew = 3'b000;
                end // state: S4

            S5 :
                begin
                    green_ns = 3'b000;
                    yellow_ns = 3'b000;
                    red_ns = 3'b001;
                    green_ew = 3'b000;
                  	yellow_ew = 3'b000;
                  	red_ew = 3'b001;                
                end // state: S5 

            endcase // case (state)
     end // always @ (state)
 endmodule
