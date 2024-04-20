array_a             dcd     2,69,90,1
array_b             dcd     2,55,90,1
dim_a               equ     4
dim_b               equ     4

                    ;r0     dimensione a
                    ;r1     dimensione b
                    ;r2     array_a
                    ;r3     elemento corrente array_a
                    ;r4     array_b
                    ;r5     elemento corrente array_b
                    ;r6     minimo array_a
                    ;r7     elemento in coda

                    mov     r0,#dim_a
                    mov     r1,#dim_b
                    mov     r2,#array_a
                    mov     r4,#array_b

scorre_vettori      
                    cmp     r0,#0
                    beq     fine_vettori

                    ldr     r3,[r2]
                    ldr     r5,[r4]
                    cmp     r3,r5
                    bgt     elemento_non_uguale
                    add     r2,r2,#4
                    add     r4,r4,#4
                    cmp     r3,#1
                    ble     minimo
                    sub     r0,r0,#1
                    sub     r1,r1,#1
                    b       scorre_vettori

elemento_non_uguale 
                    cmp     r0,#0
                    beq     scorre_vettori
                    mov     r7,r3
                    add     r2,r2,#4
                    add     r4,r4,#4
                    sub     r0,r0,#1
                    sub     r1,r1,#1
                    b       scorre_vettori

minimo              

                    mov     r6,r3
                    sub     r0,r0,#1
                    sub     r1,r1,#1
                    b       scorre_vettori


fine_vettori        
                    end