.global _start

.section .data
prompt: .asciz "Enter a number: "
result_msg: .asciz "The result is: %d\n"

.section .bss
num: .space 4
result: .space 4

.section .text
_start:
    // Print prompt
    ldr r0, =prompt
    bl printf

    // Read input
    ldr r0, =num
    bl scanf

    // Perform some operation (e.g., double the number)
    ldr r1, [r0]      // Load the number into r1
    add r1, r1, r1    // Double the number
    str r1, [result]  // Store the result

    // Print result
    ldr r0, =result_msg
    ldr r1, [result]
    bl printf

    // Exit
    mov r0, #0
    bx lr

// External functions
.extern printf
.extern scanf