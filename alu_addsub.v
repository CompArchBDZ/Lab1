`include "adder.v"
`define AND and #330
`define OR or #320
`define NOT not #10
`define XOR xor #320 //for now

module ALUAddSub
(
  output          result,
  output          carryout,
  output          zero,
  output          overflow,

  input           operandA,
  input           operandB,
  input           carryin;
  //input[2:0]      command
);

    reg  B_compl;
    wire abSum;
    wire abXor;
    wire abCinXor;

    structuralFullAdder adder (sum, operandA, operandB);
    `AND andgate(abSum, a, b); 
    `XOR xorgate(abXor, a, b); 
    `AND andgate2(abCinXor, abXor, carryin); 
    `OR orgate(carryout, abSum, abCinXor); 
    `XOR xorgate2(sum, abXor, carryin);

    //subtraction
    `NOT notgate(B_compl, operandB);

endmodule