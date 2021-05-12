        org 100h

        section .text

        XOR AX, AX
        MOV CX, 8d

        MOV byte [200h], 0d
        MOV byte [201h], 0d
        MOV byte [202h], 0d
        MOV byte [203h], 9d
        MOV byte [204h], 4d
        MOV byte [205h], 1d
        MOV byte [206h], 1d
        MOV byte [207h], 8d

        MOV BX, 200h

        jmp sum

        sum:

                ADD AL, [BX]
                ADD BX, 1h 
                loop sum

                MOV CL, 8d
                DIV CL

                MOV byte [20Ah], AL
                
        int 20h


                
                