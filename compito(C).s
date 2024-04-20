array_a        dcd     2,3,5,22,65
array_b        dcd     43,56,5,11,88
dim_a          equ     5
dim_b          equ     5
found          equ     0

               ;r1     dimensione a
               ;r2     dimensione b
               ;r3     array a
               ;r4     elemento corrente array a
               ;r5     array b
               ;r6     elemento corrente b
               ;r7     found

               mov     r1,#dim_a
               mov     r2,#dim_b
               mov     r3,#array_a
               mov     r5,#array_b
               mov     r7,#found

scorre_vettori 
               cmp     r1,#0
               beq     fine_vettori

               cmp     r2,#0
               beq     fine_vettori

               ldr     r4,[r3]
               ldr     r6,[r5]

               cmp     r4,r6
               beq     uguale
               add     r3,r3,#4
               add     r5,r5,#4
               add     r7,r7,#0

               sub     r1,r1,#1
               sub     r2,r2,#1
               b       scorre_vettori

uguale         
               add     r7,r7,#1
               add     r0,r0,#1
               add     r3,r3,#4
               add     r5,r5,#4
               sub     r1,r1,#1
               sub     r2,r2,#1
               cmp     r0,#0
               bgt     dispari
               b       scorre_vettori

dispari        
               mov     r0,r4
               b       scorre_vettori
fine_vettori   
               end