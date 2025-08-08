.global _start

.section .text
_start:
    // Example of a for loop
    mov r0, #0          // Initialize counter i to 0
    mov r1, #10         // Set loop limit to 10

for_loop:
    cmp r0, r1          // Compare i with 10
    bge end_for_loop    // If i >= 10, exit loop
    // Loop body: do something with i
    add r0, r0, #1      // Increment i
    b for_loop          // Repeat the loop

end_for_loop:

    // Example of a while loop
    mov r2, #0          // Initialize counter j to 0

while_loop:
    cmp r2, #10         // Compare j with 10
    bge end_while_loop  // If j >= 10, exit loop
    // Loop body: do something with j
    add r2, r2, #1      // Increment j
    b while_loop        // Repeat the loop

end_while_loop:

    // Example of a do-while loop
    mov r3, #0          // Initialize counter k to 0

do_while_loop:
    // Loop body: do something with k
    add r3, r3, #1      // Increment k
    cmp r3, #10         // Compare k with 10
    blt do_while_loop   // If k < 10, repeat the loop

    // Exit program
    mov r7, #1          // syscall: exit
    svc 0               // make syscall