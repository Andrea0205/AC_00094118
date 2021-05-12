        org 100h

        section .text

        XOR AX, AX
        XOR CX, CX
        MOV CL, 5d
        MOV AL, 1d

        CALL fact

        MOV CH, 1d
        MUL CH

        MOV [20Bh], AL

        JMP exit

fact:
        MUL CL
        SUB CL, 1d
        CMP CL, 0d
        JNZ fact

        ret

exit:
        int 20h
