`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 00:55:51
// Design Name: 
// Module Name: BIST_LFSR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BIST_BSCFSR(

    input clk,
    input reset,
    input [3:0] ALU_Sel,
    output match
);
    wire [7:0] A, B;
    wire [7:0] ALU_Out;
    wire CarryOut;
    wire [8:0] rom_data;
    wire [8:0] alu_data;
    reg [7:0] address;
   
    // Pattern generators
    pattern_gen_A genA (
        .clk(clk),
        .reset(reset),
        .A(A)
    );

    pattern_gen_B genB (
        .clk(clk),
        .reset(reset),
        .B(B)
    );

    // ALU instance
    alu alu_instance (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    // Combine ALU_Out and CarryOut into a single 9-bit value
    assign alu_data = {ALU_Out, CarryOut};

    // ROM instance
    ROM rom_inst (
        .address(address),
        .data(rom_data)
    );

    // Address counter to iterate through ROM
    always @(posedge clk or posedge reset) begin
        if (reset)
            address <= 8'b0;
        else
            address <= address + 1;
    end

    // Compare ALU output with ROM data
    assign match = (alu_data == rom_data);
endmodule




module ROM (
    input [7:0] address,         // 8-bit address input
    output reg [8:0] data        // 9-bit data output (8-bit ALU_Out + 1-bit CarryOut)
);
    reg [8:0] memory [0:255];    // ROM storage with 256 locations, each 9 bits wide

    initial begin
memory[0] = 9'b000000000;
memory[1] = 9'b000000000;
memory[2] = 9'b000001000;
memory[3] = 9'b000000010;
memory[4] = 9'b000100100;
memory[5] = 9'b000001100;
memory[6] = 9'b010011000;
memory[7] = 9'b100110000;
memory[8] = 9'b010110000;
memory[9] = 9'b110010011;
memory[10] = 9'b000000001;
memory[11] = 9'b111001110;
memory[12] = 9'b101110010;
memory[13] = 9'b111111111;
memory[14] = 9'b000000000;
memory[15] = 9'b000000010;
memory[16] = 9'b001101101;
memory[17] = 9'b000000000;
memory[18] = 9'b110010010;
memory[19] = 9'b000000011;
memory[20] = 9'b011100101;
memory[21] = 9'b001110000;
memory[22] = 9'b110010011;
memory[23] = 9'b011001001;
memory[24] = 9'b100100001;
memory[25] = 9'b000100000;
memory[26] = 9'b000000000;
memory[27] = 9'b011111011;
memory[28] = 9'b111101010;
memory[29] = 9'b111111110;
memory[30] = 9'b000000000;
memory[31] = 9'b000000010;
memory[32] = 9'b110100100;
memory[33] = 9'b000000001;
memory[34] = 9'b011100010;
memory[35] = 9'b000000011;
memory[36] = 9'b101111000;
memory[37] = 9'b011011011;
memory[38] = 9'b011010111;
memory[39] = 9'b101010110;
memory[40] = 9'b110101101;
memory[41] = 9'b101011001;
memory[42] = 9'b000000000;
memory[43] = 9'b010011011;
memory[44] = 9'b101001010;
memory[45] = 9'b111111111;
memory[46] = 9'b000000001;
memory[47] = 9'b000000010;
memory[48] = 9'b110010000;
memory[49] = 9'b000000001;
memory[50] = 9'b010001000;
memory[51] = 9'b000000011;
memory[52] = 9'b000011101;
memory[53] = 9'b000001110;
memory[54] = 9'b010111100;
memory[55] = 9'b100111100;
memory[56] = 9'b011111100;
memory[57] = 9'b111110111;
memory[58] = 9'b000000001;
memory[59] = 9'b000100101;
memory[60] = 9'b001001001;
memory[61] = 9'b111111111;
memory[62] = 9'b000000000;
memory[63] = 9'b000000011;
memory[64] = 9'b011110101;
memory[65] = 9'b000000000;
memory[66] = 9'b011110011;
memory[67] = 9'b000000011;
memory[68] = 9'b101011101;
memory[69] = 9'b010101111;
memory[70] = 9'b110111000;
memory[71] = 9'b010111011;
memory[72] = 9'b011110000;
memory[73] = 9'b111010001;
memory[74] = 9'b000000001;
memory[75] = 9'b010111011;
memory[76] = 9'b101101110;
memory[77] = 9'b111111111;
memory[78] = 9'b000000000;
memory[79] = 9'b000000010;
memory[80] = 9'b100001100;
memory[81] = 9'b000000001;
memory[82] = 9'b110001000;
memory[83] = 9'b000000010;
memory[84] = 9'b011100100;
memory[85] = 9'b001011100;
memory[86] = 9'b101100011;
memory[87] = 9'b110110001;
memory[88] = 9'b010100110;
memory[89] = 9'b110001111;
memory[90] = 9'b000000001;
memory[91] = 9'b110100100;
memory[92] = 9'b110000110;
memory[93] = 9'b111111110;
memory[94] = 9'b000000001;
memory[95] = 9'b000000011;
memory[96] = 9'b100111001;
memory[97] = 9'b000000001;
memory[98] = 9'b011001000;
memory[99] = 9'b000000010;
memory[100] = 9'b110011001;
memory[101] = 9'b011001101;
memory[102] = 9'b001100011;
memory[103] = 9'b000110010;
memory[104] = 9'b010100010;
memory[105] = 9'b110001011;
memory[106] = 9'b000000001;
memory[107] = 9'b110101100;
memory[108] = 9'b111000010;
memory[109] = 9'b111111110;
memory[110] = 9'b000000001;
memory[111] = 9'b000000010;
memory[112] = 9'b101001001;
memory[113] = 9'b000000001;
memory[114] = 9'b000100000;
memory[115] = 9'b000000011;
memory[116] = 9'b001000100;
memory[117] = 9'b001001010;
memory[118] = 9'b000101011;
memory[119] = 9'b000101000;
memory[120] = 9'b000101100;
memory[121] = 9'b011000010;
memory[122] = 9'b000000001;
memory[123] = 9'b101110100;
memory[124] = 9'b011010101;
memory[125] = 9'b111111110;
memory[126] = 9'b000000000;
memory[127] = 9'b000000011;
memory[128] = 9'b110001100;
memory[129] = 9'b000000001;
memory[130] = 9'b001010010;
memory[131] = 9'b000000011;
memory[132] = 9'b011011100;
memory[133] = 9'b001111010;
memory[134] = 9'b110111011;
memory[135] = 9'b111011101;
memory[136] = 9'b101110111;
memory[137] = 9'b011110010;
memory[138] = 9'b000000001;
memory[139] = 9'b001001101;
memory[140] = 9'b010011001;
memory[141] = 9'b111111110;
memory[142] = 9'b000000001;
memory[143] = 9'b000000011;
memory[144] = 9'b011111000;
memory[145] = 9'b000000000;
memory[146] = 9'b010100011;
memory[147] = 9'b000000011;
memory[148] = 9'b101111101;
memory[149] = 9'b010111111;
memory[150] = 9'b111110100;
memory[151] = 9'b111111101;
memory[152] = 9'b111110101;
memory[153] = 9'b111101001;
memory[154] = 9'b000000001;
memory[155] = 9'b001011001;
memory[156] = 9'b010110011;
memory[157] = 9'b111111110;
memory[158] = 9'b000000001;
memory[159] = 9'b000000010;
memory[160] = 9'b101100100;
memory[161] = 9'b000000001;
memory[162] = 9'b101001001;
memory[163] = 9'b000000010;
memory[164] = 9'b101010100;
memory[165] = 9'b011010101;
memory[166] = 9'b010100011;
memory[167] = 9'b001100010;
memory[168] = 9'b101000111;
memory[169] = 9'b010010010;
memory[170] = 9'b000000001;
memory[171] = 9'b110110110;
memory[172] = 9'b110011110;
memory[173] = 9'b111111110;
memory[174] = 9'b000000001;
memory[175] = 9'b000000011;
memory[176] = 9'b000101100;
memory[177] = 9'b000000000;
memory[178] = 9'b010001000;
memory[179] = 9'b000000010;
memory[180] = 9'b111101000;
memory[181] = 9'b011101011;
memory[182] = 9'b101010111;
memory[183] = 9'b010101011;
memory[184] = 9'b011010100;
memory[185] = 9'b101010111;
memory[186] = 9'b000000000;
memory[187] = 9'b010100001;
memory[188] = 9'b100100000;
memory[189] = 9'b111111111;
memory[190] = 9'b000000000;
memory[191] = 9'b000000011;
memory[192] = 9'b111001001;
memory[193] = 9'b000000001;
memory[194] = 9'b011001001;
memory[195] = 9'b000000011;
memory[196] = 9'b001010000;
memory[197] = 9'b001100000;
memory[198] = 9'b010000111;
memory[199] = 9'b101000000;
memory[200] = 9'b100001001;
memory[201] = 9'b000001100;
memory[202] = 9'b000000000;
memory[203] = 9'b111001000;
memory[204] = 9'b101100000;
memory[205] = 9'b111111111;
memory[206] = 9'b000000000;
memory[207] = 9'b000000010;
memory[208] = 9'b111111101;
memory[209] = 9'b000000001;
memory[210] = 9'b000100001;
memory[211] = 9'b000000011;
memory[212] = 9'b111000001;
memory[213] = 9'b011100001;
memory[214] = 9'b100001011;
memory[215] = 9'b110000101;
memory[216] = 9'b000001110;
memory[217] = 9'b001010110;
memory[218] = 9'b000000000;
memory[219] = 9'b100100100;
memory[220] = 9'b010000111;
memory[221] = 9'b111111110;
memory[222] = 9'b000000001;
memory[223] = 9'b000000011;
memory[224] = 9'b100011001;
memory[225] = 9'b000000001;
memory[226] = 9'b010110010;
memory[227] = 9'b000000010;
memory[228] = 9'b101010000;
memory[229] = 9'b011010001;
memory[230] = 9'b010000011;
memory[231] = 9'b001000000;
memory[232] = 9'b100000001;
memory[233] = 9'b000000100;
memory[234] = 9'b000000000;
memory[235] = 9'b111101100;
memory[236] = 9'b111100110;
memory[237] = 9'b111111110;
memory[238] = 9'b000000000;
memory[239] = 9'b000000010;
memory[240] = 9'b100100101;
memory[241] = 9'b000000001;
memory[242] = 9'b010000000;
memory[243] = 9'b000000010;
memory[244] = 9'b001001101;
memory[245] = 9'b000011000;
memory[246] = 9'b100111000;
memory[247] = 9'b110011011;
memory[248] = 9'b001110110;
memory[249] = 9'b010111010;
memory[250] = 9'b000000001;
memory[251] = 9'b010001101;
memory[252] = 9'b100011100;
memory[253] = 9'b111111111;
memory[254] = 9'b000000001;
memory[255] = 9'b000000011;
    end

    always @(*) begin
        data = memory[address];  // Read data from memory based on address
    end
endmodule

module alu (
    input [7:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A + B ;
        4'b0010: // Multiplication
           ALU_Result = A * B;
        4'b0011: // Division
           ALU_Result = A/B;
        4'b0100: // Logical shift left
           ALU_Result = A<<1;
         4'b0101: // Logical shift right
           ALU_Result = A>>1;
         4'b0110: // Rotate left
           ALU_Result = {A[6:0],A[7]};
         4'b0111: // Rotate right
           ALU_Result = {A[0],A[7:1]};
          4'b1000: //  Logical and 
           ALU_Result = A & B;
          4'b1001: //  Logical or
           ALU_Result = A | B;
          4'b1010: //  Logical xor 
           ALU_Result = A ^ B;
          4'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          4'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          4'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          4'b1110: // Greater comparison
           ALU_Result = (A>B)?8'd1:8'd0 ;
          4'b1111: // Equal comparison   
           ALU_Result = (A==B)?8'd1:8'd0 ;
          default: ALU_Result = A + B ; 
        endcase
    end
 endmodule

/*
module pattern_gen_A(
    input clk, reset,
    output reg [7:0] A  // Declare A as a reg
);

    reg [7:0] Temp; 
    wire A_temp =((~(A[0] | A[1] | A[2] | A[3] | A[4] | A[5] | A[6])));
        // Register to store XORShift output

    // Initial setup: When reset, load A with an initial value
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 8'b00000000;  // Initialize A with the given input
            Temp <= 8'b00000000;  // Initialize Temp
        end
        else begin
            
           
            
            
            A[0] <= (Temp[7]) ? Temp[0] : Temp[1];  
            A[1] <= (Temp[7]) ? Temp[1] : Temp[0];  
            A[2] <= (Temp[7]) ? Temp[2] : Temp[3];  
            A[3] <= (Temp[7]) ? Temp[3] : Temp[2];  
            A[4] <= (Temp[7]) ? Temp[4] : Temp[5];  
            A[5] <= (Temp[7]) ? Temp[5] : Temp[4];  
            A[6] <= Temp[6];  
            A[7] <= Temp[7];  
            
            Temp<=A;
            // XORShift Operation
            Temp[0] <= ((Temp[5] ^ (A_temp ^ Temp[7])) ^ Temp[4]) ^ Temp[3];
            Temp[1] <= Temp[0];
            Temp[2] <= Temp[1];
            Temp[3] <= Temp[2];
            Temp[4] <= Temp[3];
            Temp[5] <= Temp[4];
            Temp[6] <= Temp[5];
            Temp[7] <= Temp[6];
           
        end
    end
endmodule


module pattern_gen_B(
    input clk, reset,
    output reg [7:0] B  // Declare A as a reg
);

    reg [7:0] Temp; 
    wire B_temp =((~(B[0] | B[1] | B[2] | B[3] | B[4] | B[5] | B[6])));
        // Register to store XORShift output

    // Initial setup: When reset, load A with an initial value
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            B <= 8'b00000000;  // Initialize A with the given input
            Temp <= 8'b00000000;  // Initialize Temp
        end
        else begin
            
           
            
            
            B[0] <= (Temp[7]) ? Temp[0] : Temp[1];  
            B[1] <= (Temp[7]) ? Temp[1] : Temp[0];  
            B[2] <= (Temp[7]) ? Temp[2] : Temp[3];  
            B[3] <= (Temp[7]) ? Temp[3] : Temp[2];  
            B[4] <= (Temp[7]) ? Temp[4] : Temp[5];  
            B[5] <= (Temp[7]) ? Temp[5] : Temp[4];  
            B[6] <= Temp[6];  
            B[7] <= Temp[7];  
            
            Temp<=B;
            // XORShift OperBtion
            Temp[0] <= ((Temp[5] ^ (B_temp ^ Temp[7])) ^ Temp[4]) ^ Temp[3];
            Temp[1] <= Temp[0];
            Temp[2] <= Temp[1];
            Temp[3] <= Temp[2];
            Temp[4] <= Temp[3];
            Temp[5] <= Temp[4];
            Temp[6] <= Temp[5];
            Temp[7] <= Temp[6];
           
        end
    end
endmodule
*/
module pattern_gen_A (
    input clk,
    input reset,
    output [7:0] A
);
   
reg [7:0]inp=8'b00000010;
wire temp=((~(inp[0] | inp[1] | inp[2] | inp[3] | inp[4] | inp[5] | inp[6])));



always @(posedge clk or posedge reset) begin
  if (reset) begin
    inp <= 8'b00000010; // Reset to initial value
  end else
  begin
 inp[0] <= ((inp[5] ^ (temp^inp[7])) ^inp[4]) ^inp[3]; ;
 inp[1] <=inp[0];

 inp[2] <=inp[1] ;
 inp[3] <=inp[2];
   inp[4] <=inp[3] ;
 inp[5] <=inp[4];
   inp[6] <=inp[5] ;
 inp[7] <=inp[6];
 
 
 

end
end

assign A = (inp[7] == 1'b1) ?  inp:{inp[7:6], inp[4], inp[5], inp[2], inp[3], inp[0], inp[1]} ;

endmodule


module pattern_gen_B (
    input clk,
    input reset,
    output  [7:0] B
);
   
reg [7:0]inp=8'b00000001;
wire temp=((~(inp[0] | inp[1] | inp[2] | inp[3] | inp[4] | inp[5] | inp[6])));



always @(posedge clk or posedge reset) begin
  if (reset) begin
    inp <= 8'b00000000; // Reset to initial value
  end else
  begin
 inp[0] <= ((inp[5] ^ (temp^inp[7])) ^inp[4]) ^inp[3]; ;
 inp[1] <=inp[0];

 inp[2] <=inp[1] ;
 inp[3] <=inp[2];
   inp[4] <=inp[3] ;
 inp[5] <=inp[4];
   inp[6] <=inp[5] ;
 inp[7] <=inp[6];
 
 
 

end
end

assign B= (inp[7] == 1'b1) ?  inp:{inp[7:6], inp[4], inp[5], inp[2], inp[3], inp[0], inp[1]} ;

endmodule

