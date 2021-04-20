        org 100h


        section .text

        ;Mi nombre es Andrea Pamela Ochoa Figueroa

        mov byte [200h], "A"
        mov byte [201h], "P"
        mov byte [202h], "O"
        mov byte [203h], "F"

        ;Direccionamiento directo
        mov AL, [200]

        ;Direccionamiento indirecto por registro
        mov BX, 201h
        mov CL, [BX]

        ;Direccionamiento indirecto base más indice
        mov SI, 1h

        mov DL, [BX + SI]

        ;Direccionamiento relativo por registro

        mov DI, [BX, 2h]
        

        int 20h