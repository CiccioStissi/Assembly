vettore        dcd     1,45,78,33,10
dimensione     equ     5
even           equ     0
odd            equ     0

               ;r1     dimensione
               ;r2     vettore
               ;r3     contatore
               ;r4     elemento corrente del vettore
               ;r5     even numeri pari
               ;r9     contatore even
               ;r6     odd numeri dispari
               ;r10    contatore odd
               ;r7     minimo
               ;r8     massimo

               mov     r1,#dimensione
               mov     r2,#vettore
               mov     r5,#even
               mov     r6,#odd

scorre_vettore 

               cmp     r1,#0
               beq     fine_vettore

               ldr     r3,[r2]
               and     r4,r3,#1
               cmp     r4,#0
               beq     pari
               bne     dispari

pari           
               mov     r5,r3
               add     r2,r2,#4
               add     r9,r9,#1
               sub     r1,r1,#1
               b       min_max

dispari        
               mov     r6,r3
               add     r2,r2,#4
               add     r10,r10,#1
               sub     r1,r1,#1
               b       min_max

massimo        
               mov     r8,r3
               b       scorre_vettore

minimo         
               mov     r7,r3
               b       scorre_vettore

min_max        
               cmp     r3,r7
               blt     minimo
               cmp     r3,r8
               bgt     massimo
               b       scorre_vettore

fine_vettore   
               end
