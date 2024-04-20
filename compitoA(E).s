vettore         dcd     20,3,54,7,80
dimensione      equ     5
evens           equ     0 ;pari
odds            equ     0 ;dispari

                ;r0     dimensione
                ;r1     vettore
                ;r2     elemento corrente vettore
                ;r3     evens
                ;r4     minimo evens
                ;r5     massimo evens
                ;r6     odds
                ;r7     minimo odds
                ;r8     massimo odds
                ;r9     contatore pari o dispari

                mov     r0,#dimensione
                mov     r1,#vettore
                mov     r3,#evens
                mov     r6,#odds

scorre_vettore  
                cmp     r0,#0
                beq     fine_vettore

                ldr     r2,[r1]
                and     r9,r2,#1 ;uso per stabilire se l'elemento è pari o dispari
                cmp     r9,#0
                beq     pari
                bne     dispari


pari            
                mov     r3,r2
                add     r1,r1,#4
                ldr     r2,[r1]
                cmp     r3,r2
                bge     massimo_pari
                ble     minimo_pari


dispari         
                mov     r6,r2
                add     r1,r1,#4
                ldr     r2,[r1]
                cmp     r6,r2
                bge     massimo_dispari
                ble     minimo_dispari

minimo_pari     
                cmp     r0,#0
                beq     fine_vettore
                mov     r4,r3
                sub     r0,r0,#1
                b       scorre_vettore

massimo_pari    
                cmp     r0,#0
                beq     fine_vettore
                mov     r5,r3
                sub     r0,r0,#1
                b       scorre_vettore

minimo_dispari  
                cmp     r0,#0
                beq     fine_vettore
                mov     r7,r6
                sub     r0,r0,#1
                b       scorre_vettore

massimo_dispari 
                cmp     r0,#0
                beq     fine_vettore
                mov     r8,r6
                sub     r0,r0,#1
                b       scorre_vettore
fine_vettore    
                end