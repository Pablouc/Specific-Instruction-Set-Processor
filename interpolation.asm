        ld r1 r1 
        ld r2 r4

        mult r1 r1 2
        div r1 r1 3

        div r2 r2 3

        add r3 r2 r1
            
        str r2 r3

        bcnd r1 r2


        add r2 r2 2
        mult r2 r2 r5

        div r1 r1 r3

        add r3 r2 r1
            
        br r3 r3
