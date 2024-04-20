vettore_v      dcd     23,43,2,80,22
dim_v          equ     5
k_int          equ     1

               mov     r1,#dim_v
               mov     r2,#k_int
               mov     r3,#vettore_v

               ;r1     dimensione
               ;r2     k
               ;r3     v
               ;r4     elemento corrente v
               ;r5     pari o dispari
               ;r6     a1
               ;r7     conteggio elementi a1
               ;r8     a2
               ;r9     conteggio elementi a2
               ;r10    vettore più grande

scorre_vettore 
               cmp     r1,#0
               beq     fine

               ldr     r4,[r3]
               and     r5,r4,r2
               cmp     r5,#0
               beq     a1
               b       a2

a1             
               mov     r6,r4
               add     r3,r3,#4
               add     r7,r7,#1
               sub     r1,r1,#1
               b       cmp_vettori


a2             
               mov     r8,r4
               add     r3,r3,#4
               add     r9,r9,#1
               sub     r1,r1,#1
               b       cmp_vettori

cmp_vettori    
               cmp     r7,r9
               bgt     a1_magg
               mov     r0,#2
               b       scorre_vettore

a1_magg        
               mov     r0,#1
               b       scorre_vettore

fine           
               end