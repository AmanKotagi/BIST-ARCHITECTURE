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


module BIST_LFSR(

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
memory[0] = 9'b000000110;
memory[1] = 9'b000000100;
memory[2] = 9'b001000000;
memory[3] = 9'b000000100;
memory[4] = 9'b010001100;
memory[5] = 9'b001000110;
memory[6] = 9'b000111010;
memory[7] = 9'b000011100;
memory[8] = 9'b000110000;
memory[9] = 9'b011110010;
memory[10] = 9'b100100111;
memory[11] = 9'b000110011;
memory[12] = 9'b011111111;
memory[13] = 9'b011001000;
memory[14] = 9'b000000010;
memory[15] = 9'b000000000;
memory[16] = 9'b111000100;
memory[17] = 9'b100101110;
memory[18] = 9'b100010000;
memory[19] = 9'b000000101;
memory[20] = 9'b111000001;
memory[21] = 9'b011100001;
memory[22] = 9'b100000011;
memory[23] = 9'b110000001;
memory[24] = 9'b000000010;
memory[25] = 9'b000001110;
memory[26] = 9'b000010100;
memory[27] = 9'b111000100;
memory[28] = 9'b111011110;
memory[29] = 9'b101010010;
memory[30] = 9'b000000011;
memory[31] = 9'b000000001;
memory[32] = 9'b101101100;
memory[33] = 9'b001001010;
memory[34] = 9'b111010110;
memory[35] = 9'b000000000;
memory[36] = 9'b100110100;
memory[37] = 9'b010011010;
memory[38] = 9'b011011100;
memory[39] = 9'b001101110;
memory[40] = 9'b010011001;
memory[41] = 9'b111111011;
memory[42] = 9'b110010111;
memory[43] = 9'b000010011;
memory[44] = 9'b001111111;
memory[45] = 9'b101001111;
memory[46] = 9'b000000000;
memory[47] = 9'b000000000;
memory[48] = 9'b110000110;
memory[49] = 9'b100000110;
memory[50] = 9'b001100100;
memory[51] = 9'b000000100;
memory[52] = 9'b010101100;
memory[53] = 9'b001010110;
memory[54] = 9'b010110111;
memory[55] = 9'b101011011;
memory[56] = 9'b000100101;
memory[57] = 9'b111111111;
memory[58] = 9'b101101111;
memory[59] = 9'b000000001;
memory[60] = 9'b110111101;
memory[61] = 9'b010000101;
memory[62] = 9'b000000001;
memory[63] = 9'b000000001;
memory[64] = 9'b000010111;
memory[65] = 9'b101100111;
memory[66] = 9'b000101111;
memory[67] = 9'b000000001;
memory[68] = 9'b010110000;
memory[69] = 9'b001011000;
memory[70] = 9'b011000011;
memory[71] = 9'b101100001;
memory[72] = 9'b010000011;
memory[73] = 9'b110001111;
memory[74] = 9'b100010000;
memory[75] = 9'b111000000;
memory[76] = 9'b111000010;
memory[77] = 9'b101111000;
memory[78] = 9'b000000011;
memory[79] = 9'b000000001;
memory[80] = 9'b111000111;
memory[81] = 9'b111011101;
memory[82] = 9'b100011011;
memory[83] = 9'b000000001;
memory[84] = 9'b101111001;
memory[85] = 9'b010111101;
memory[86] = 9'b111101001;
memory[87] = 9'b111110101;
memory[88] = 9'b111000011;
memory[89] = 9'b111111111;
memory[90] = 9'b011110011;
memory[91] = 9'b000000001;
memory[92] = 9'b111001111;
memory[93] = 9'b001100011;
memory[94] = 9'b000000011;
memory[95] = 9'b000000001;
memory[96] = 9'b011100111;
memory[97] = 9'b101000100;
memory[98] = 9'b001000000;
memory[99] = 9'b000000000;
memory[100] = 9'b010000100;
memory[101] = 9'b001000010;
memory[102] = 9'b000011010;
memory[103] = 9'b100001100;
memory[104] = 9'b000010010;
memory[105] = 9'b001111110;
memory[106] = 9'b010110100;
memory[107] = 9'b000000111;
memory[108] = 9'b011011111;
memory[109] = 9'b001011011;
memory[110] = 9'b000000011;
memory[111] = 9'b000000001;
memory[112] = 9'b101011010;
memory[113] = 9'b000111100;
memory[114] = 9'b010111000;
memory[115] = 9'b000000101;
memory[116] = 9'b110011101;
memory[117] = 9'b011001111;
memory[118] = 9'b001110011;
memory[119] = 9'b100111000;
memory[120] = 9'b001100010;
memory[121] = 9'b111101111;
memory[122] = 9'b001010101;
memory[123] = 9'b001000111;
memory[124] = 9'b111011110;
memory[125] = 9'b101011000;
memory[126] = 9'b000000011;
memory[127] = 9'b000000001;
memory[128] = 9'b101000010;
memory[129] = 9'b000101110;
memory[130] = 9'b110100100;
memory[131] = 9'b000000101;
memory[132] = 9'b110100101;
memory[133] = 9'b011010011;
memory[134] = 9'b010010011;
memory[135] = 9'b001001000;
memory[136] = 9'b000000000;
memory[137] = 9'b101100110;
memory[138] = 9'b011001110;
memory[139] = 9'b001100000;
memory[140] = 9'b111111110;
memory[141] = 9'b110000100;
memory[142] = 9'b000000010;
memory[143] = 9'b000000000;
memory[144] = 9'b111011110;
memory[145] = 9'b010010110;
memory[146] = 9'b011100100;
memory[147] = 9'b000000100;
memory[148] = 9'b010100100;
memory[149] = 9'b001010010;
memory[150] = 9'b010011110;
memory[151] = 9'b001001110;
memory[152] = 9'b000011000;
memory[153] = 9'b101111110;
memory[154] = 9'b010011000;
memory[155] = 9'b000000001;
memory[156] = 9'b001100111;
memory[157] = 9'b100110011;
memory[158] = 9'b000000001;
memory[159] = 9'b000000001;
memory[160] = 9'b110001011;
memory[161] = 9'b110110101;
memory[162] = 9'b000001011;
memory[163] = 9'b000000101;
memory[164] = 9'b001111001;
memory[165] = 9'b000111100;
memory[166] = 9'b111101100;
memory[167] = 9'b111110111;
memory[168] = 9'b111001111;
memory[169] = 9'b111111111;
memory[170] = 9'b011000001;
memory[171] = 9'b000000001;
memory[172] = 9'b100000111;
memory[173] = 9'b111110001;
memory[174] = 9'b000000001;
memory[175] = 9'b000000001;
memory[176] = 9'b101111001;
memory[177] = 9'b110100111;
memory[178] = 9'b010010000;
memory[179] = 9'b000000100;
memory[180] = 9'b011001100;
memory[181] = 9'b001100110;
memory[182] = 9'b100110111;
memory[183] = 9'b010011011;
memory[184] = 9'b000100000;
memory[185] = 9'b011111110;
memory[186] = 9'b101111101;
memory[187] = 9'b000000111;
memory[188] = 9'b111111110;
memory[189] = 9'b000011010;
memory[190] = 9'b000000000;
memory[191] = 9'b000000000;
memory[192] = 9'b101001000;
memory[193] = 9'b000110000;
memory[194] = 9'b000000000;
memory[195] = 9'b000000101;
memory[196] = 9'b000001101;
memory[197] = 9'b000000110;
memory[198] = 9'b000111000;
memory[199] = 9'b100011100;
memory[200] = 9'b000110000;
memory[201] = 9'b011111110;
memory[202] = 9'b100111111;
memory[203] = 9'b000000001;
memory[204] = 9'b011111111;
memory[205] = 9'b000000000;
memory[206] = 9'b000000011;
memory[207] = 9'b000000001;
memory[208] = 9'b000001101;
memory[209] = 9'b101100001;
memory[210] = 9'b100000101;
memory[211] = 9'b000000001;
memory[212] = 9'b111100101;
memory[213] = 9'b011110011;
memory[214] = 9'b110010111;
memory[215] = 9'b011001011;
memory[216] = 9'b100000001;
memory[217] = 9'b101111000;
memory[218] = 9'b011110000;
memory[219] = 9'b000011100;
memory[220] = 9'b111111110;
memory[221] = 9'b001110010;
memory[222] = 9'b000000000;
memory[223] = 9'b000000000;
memory[224] = 9'b001110100;
memory[225] = 9'b001010000;
memory[226] = 9'b000100010;
memory[227] = 9'b000000000;
memory[228] = 9'b111111100;
memory[229] = 9'b011111111;
memory[230] = 9'b111111011;
memory[231] = 9'b011111101;
memory[232] = 9'b111110001;
memory[233] = 9'b111110001;
memory[234] = 9'b000100011;
memory[235] = 9'b000111001;
memory[236] = 9'b011111111;
memory[237] = 9'b011100010;
memory[238] = 9'b000000010;
memory[239] = 9'b000000000;
memory[240] = 9'b100011010;
memory[241] = 9'b010111101;
memory[242] = 9'b001000001;
memory[243] = 9'b000000101;
memory[244] = 9'b110001101;
memory[245] = 9'b011000111;
memory[246] = 9'b000110111;
memory[247] = 9'b000011010;
memory[248] = 9'b000100000;
memory[249] = 9'b011111000;
memory[250] = 9'b101110001;
memory[251] = 9'b000011111;
memory[252] = 9'b111111110;
memory[253] = 9'b001111110;
memory[254] = 9'b000000000;
memory[255] = 9'b000000000;

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
    assign  ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
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




module pattern_gen_A (
    input clk,
    input reset,
    output reg [7:0] A  // Declare A as a reg
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        A <= 8'b00000010; // Reset to initial value
    end else begin
        A[0] <= ((A[5] ^ A[7]) ^ A[4]) ^ A[3];
        A[1] <= A[0];
        A[2] <= A[1];
        A[3] <= A[2];
        A[4] <= A[3];
        A[5] <= A[4];
        A[6] <= A[5];
        A[7] <= A[6];
    end
end

endmodule

module pattern_gen_B (
    input clk,
    input reset,
    output reg [7:0] B  // Declare B as a reg
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        B <= 8'b00000001; // Reset to initial value
    end else begin
        B[0] <= ((B[5] ^ B[7]) ^ B[4]) ^ B[3];
        B[1] <= B[0];
        B[2] <= B[1];
        B[3] <= B[2];
        B[4] <= B[3];
        B[5] <= B[4];
        B[6] <= B[5];
        B[7] <= B[6];
    end
end

endmodule

