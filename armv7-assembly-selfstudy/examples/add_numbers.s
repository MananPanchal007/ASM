.section .data
    num1: .word 5
    num2: .word 10
    result: .word 0
    msg: .asciz "The sum is: %d\n"

.section .text
    .global _start

_start:
    // Load numbers into registers
    ldr r0, =num1
    ldr r1, [r0]       // Load num1 into r1
    ldr r0, =num2
    ldr r2, [r0]       // Load num2 into r2

    // Add the numbers
    add r3, r1, r2     // r3 = num1 + num2

    // Store the result
    ldr r0, =result
    str r3, [r0]       // Store the result in memory

    // Print the result
    ldr r0, =msg
    ldr r1, [r0]       // Load the message
    ldr r0, =result
    ldr r2, [r0]       // Load the result to print
    bl printf          // Call printf to output the result

    // Exit the program
    mov r0, #0
    bx lr              // Return from main (exit)