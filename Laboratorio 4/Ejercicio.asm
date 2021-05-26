        org 100h

        section .text

        XOR DI, DI
        XOR SI, SI
        XOR BP, BP

        call For

        int 20h

        section .data

        number DB 1,2,3,4,5,6,7,8,9,3, 0xA

For:
        MOV BX, 2d ;esto determinara si es par o no
        MOV byte AL, [number + DI]

        CMP AL, 0xA ;0xA se ocupa como condición de paro
        JE end

        DIV BX
        CMP DX, 0d
        JE pair

        CMP DX, 1d
        JE impair

        JMP For
end:
        ret

pair:
        MOV byte BL, [number+DI]
        MOV [300h+SI], BL
        inc DI
        inc SI
        JMP For

impair:
        MOV byte BL, [number+DI]
        MOV [320h+BP], BL
        inc DI
        inc BP
        JMP For





