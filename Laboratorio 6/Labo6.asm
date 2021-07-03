;Andrea Pamela Ochoa Figueroa

; GUARDAR UNA CADENA EN UN VARIABLE Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

        mov BP, words
        call    ReadChain

	call 	EscribirCadena

	call	EsperarTecla

	int 	20h


; FUNCIONES: se usaran ReadChain, EscribirCadena, EsperarTecla, Correcto, Incorrecto y Comparar

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
ReadChain:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     comparar           ; saltar a while

exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret


; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret

;esta funcion vera los caracteres para determinar si esta correcto o si esta incorrecto
comparar: 
        mov BL, [words + SI]
        mov CL, [password + SI]
        cmp CL, BL
        jnp incorrecto
        INC SI
        loop comparar
        jmp correcto
        ; jmp while 

;Creación de incorrecto
incorrecto:
        xor DX, DX        ;se limpia la variable DX
        mov DX, msg2
        jmp while

;Creación de correcto
correcto:
        xor DX, DX            ;se limpia la variable DX
        mov DX, msg1
        jmp while


        
	section	.data

msg1	db	"Bienvenido$"
msg2 	db 	"Incorrecto$"
words 	times 	20  	db	" " 	;palabra que sera leida
password   db    "hola123"