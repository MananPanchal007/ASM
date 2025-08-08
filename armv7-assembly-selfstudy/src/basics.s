.global _start

.section .text
_start:
    // Data movement examples
    MOV R0, #5          // Move the value 5 into register R0
    MOV R1, #10         // Move the value 10 into register R1
    ADD R2, R0, R1      // Add R0 and R1, store result in R2

    // Arithmetic operations
    SUB R3, R1, R0      // Subtract R0 from R1, store result in R3
    MUL R4, R0, R1      // Multiply R0 and R1, store result in R4
    DIV R5, R1, R0      // Divide R1 by R0, store result in R5 (pseudo-instruction)

    // Control flow example
    CMP R0, #0          // Compare R0 with 0
    BEQ end             // Branch to end if R0 is equal to 0

    // Loop example (simple decrement loop)
    MOV R6, #10         // Initialize loop counter
loop_start:
    SUB R6, R6, #1      // Decrement loop counter
    CMP R6, #0          // Compare loop counter with 0
    BNE loop_start      // If not equal, repeat loop

end:
    // Exit program (pseudo-instruction)
    MOV R7, #1          // syscall number for exit
    SWI 0               // make syscall to exit