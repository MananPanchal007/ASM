.global factorial
.global main

.section .text

factorial:
    cmp r0, #1          // Compare n with 1
    ble end_factorial   // If n <= 1, jump to end_factorial
    push {r0, lr}       // Save r0 and link register on stack
    sub r0, r0, #1      // n = n - 1
    bl factorial         // Recursive call
    pop {r1, lr}        // Restore r1 and link register from stack
    mul r0, r0, r1      // r0 = n * factorial(n - 1)
end_factorial:
    bx lr               // Return from function

main:
    // Example usage of factorial function
    mov r0, #5          // Calculate factorial of 5
    bl factorial         // Call factorial function
    // Result is now in r0
    // Add code here to output the result if needed
    bx lr               // Return from main