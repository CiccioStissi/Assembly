vettore        dcd     33,54,7,8,9,0
vettore_pari   dcd     0

               ;r1     dimensione vettore
               ;r2     vettore
               ;r3     elemento corrente vettore
               ;r4     elemento corrente verifica
               ;r5     verifica pari
               ;r6     elemento pari

               mov     r2,#vettore
               mov     r4,#vettore_pari

scorre_vettore 
               ldr     r3,[r2]
               add     r2,r2,#4
               add     r1,r1,#1
               cmp     r1,#6
               beq     controllo_pari
               b       scorre_vettore


controllo_pari 
               ldr     r3,[r2]
               mov     r4,r3
               sub     r2,r2,#4
               and     r5,r3,#1
               cmp     r5,#0
               beq     pari
               sub     r1,r1,#1
               cmp     r1,#0
               beq     fine
               b       controllo_pari

pari           
               mov     r6,r3
               sub     r1,r1,#1
               sub     r2,r2,#4
               cmp     r1,#0
               beq     fine
               b       controllo_pari

fine           
               end