.global add_numbers
.global factorial
.global fibonacci

.section .text

add_numbers:
    // Function to add two numbers
    // Parameters: r0 = first number, r1 = second number
    add r0, r0, r1  // Add r0 and r1, result in r0
    bx lr           // Return from function

factorial:
    // Function to calculate factorial of a number
    // Parameter: r0 = n
    cmp r0, #1      // Compare n with 1
    ble end_factorial // If n <= 1, jump to end
    push {r0}       // Save r0 on stack
    sub r0, r0, #1  // n = n - 1
    bl factorial     // Recursive call
    pop {r1}        // Restore r1 from stack
    mul r0, r0, r1  // Multiply n with factorial(n-1)
end_factorial:
    bx lr           // Return from function

fibonacci:
    // Function to calculate Fibonacci number
    // Parameter: r0 = n
    cmp r0, #0      // Compare n with 0
    beq fib_zero    // If n == 0, return 0
    cmp r0, #1      // Compare n with 1
    beq fib_one     // If n == 1, return 1
    push {r0}       // Save r0 on stack
    sub r0, r0, #1  // n = n - 1
    bl fibonacci     // Recursive call for n-1
    mov r1, r0      // Store result of fibonacci(n-1) in r1
    pop {r0}        // Restore r0 from stack
    sub r0, r0, #2  // n = n - 2
    bl fibonacci     // Recursive call for n-2
    add r0, r0, r1  // Add fibonacci(n-1) and fibonacci(n-2)
    bx lr           // Return from function

fib_zero:
    mov r0, #0      // Return 0 for fibonacci(0)
    bx lr           // Return from function

fib_one:
    mov r0, #1      // Return 1 for fibonacci(1)
    bx lr           // Return from function