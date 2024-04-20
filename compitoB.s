vettore        dcd     1,16,32,80,10
dimensione     equ     5
sixteen        equ     16

               ;r0     dimensione
               ;r1     vettore
               ;r2     elemento corrente vettore
               ;r3     sixteen
               ;r4     elemento sixteen
               ;r5     maggiore di zero
               ;r6     massimo
               ;r7     minimo
               ;r8     valore medio

               mov     r0,#dimensione
               mov     r1,#vettore
               mov     r3,#sixteen

               ldr     r7,[r1]

scorre_vettore 
               cmp     r0,#0
               beq     fine_vettore

               ldr     r2,[r1]
               add     r1,r1,#4

               cmp     r2,#0
               beq     maggiore_zero

               cmp     r2,r3
               blt     non_divisibile
               mov     r4,r2
               mov     r6,r2 ;va aggiornando sempre il massimo

               cmp     r7,r2
               beq     minimo

               sub     r0,r0,#1
               b       scorre_vettore

non_divisibile 
               sub     r0,r0,#1
               b       scorre_vettore

minimo         
               mov     r7,r2
               b       scorre_vettore

maggiore_zero  
               add     r5,r5,#1
               b       scorre_vettore

fine_vettore   
               end