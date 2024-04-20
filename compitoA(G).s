vettore_a       dcd     10,1,33,6,88,25
vettore_b       dcd     44,2,33,7,20,25
dim_a           equ     6
dim_b           equ     6

                ;r0     elementi uguali
                ;r1     dimensione a
                ;r2     dimensione b
                ;r3     vettore a
                ;r4     elemento corrente vettore a
                ;r5     vettore b
                ;r6     elemento corrente vettore b

                mov     r1,#dim_a
                mov     r2,#dim_b
                mov     r3,#vettore_a
                mov     r5,#vettore_b


scorre_vettori  
                cmp     r1,#0
                beq     fine
                cmp     r2,#0
                beq     fine

                ldr     r4,[r3]
                ldr     r6,[r5]
                cmp     r4,r6
                beq     elemento_uguale
                add     r3,r3,#4
                add     r5,r5,#4
                sub     r1,r1,#1
                sub     r2,r2,#1
                b       scorre_vettori


elemento_uguale 
                mov     r0,r4
                add     r3,r3,#4
                add     r5,r5,#4
                sub     r1,r1,#1
                sub     r2,r2,#1
                b       scorre_vettori

fine            
                end