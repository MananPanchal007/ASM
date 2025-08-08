.section .data
    n: .word 10          // Number of Fibonacci numbers to generate
    fib: .space 40       // Space for storing Fibonacci numbers (10 numbers * 4 bytes each)

.section .text
.global _start

_start:
    ldr r0, =n           // Load address of n
    ldr r1, [r0]         // Load value of n into r1
    ldr r2, =fib         // Load address of fib array
    mov r3, #0           // Initialize index i to 0
    mov r4, #0           // Initialize first Fibonacci number (fib[0])
    mov r5, #1           // Initialize second Fibonacci number (fib[1])

.loop:
    cmp r3, r1           // Compare i with n
    bge .done            // If i >= n, exit loop

    str r4, [r2, r3, lsl #2] // Store fib[i] in fib array
    add r6, r4, r5       // Calculate next Fibonacci number
    mov r4, r5           // Update fib[i] to fib[i+1]
    mov r5, r6           // Update fib[i+1] to fib[i+2]
    add r3, r3, #1       // Increment index i
    b .loop              // Repeat the loop

.done:
    // Exit the program (implementation may vary based on the environment)
    mov r7, #1           // syscall: exit
    svc 0                 // make syscall to exit