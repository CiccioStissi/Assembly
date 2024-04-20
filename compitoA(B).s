array_a      dcd     4,6,20,11
array_b      dcd     5,6,33,44
dimensione_a equ     4
dimensione_b equ     4
occurences   equ     0

             ;r0     dimensione A
             ;r1     dimensione B
             ;r2     array A
             ;r3     elemento corrente array A
             ;r4     array B
             ;r5     elemento corrente array B
             ;r6     occurences

             mov     r0,#dimensione_a
             mov     r1,#dimensione_b
             mov     r2,#array_a
             mov     r4,#array_b
             mov     r6,#occurences

scorre_array 
             cmp     r0,#0
             beq     fine_scorre

             cmp     r1,#0
             beq     fine_scorre

             ldr     r3,[r2]
             ldr     r5,[r4]

             cmp     r3,r5
             beq     occorrenze

             add     r2,r2,#4
             add     r4,r4,#4

             sub     r0,r0,#1
             sub     r1,r1,#1
             b       scorre_array

occorrenze   
             add     r6,r6,#1
             add     r2,r2,#4
             add     r4,r4,#4
             sub     r0,r0,#1
             sub     r1,r1,#1
             b       scorre_array

fine_scorre  
             end
