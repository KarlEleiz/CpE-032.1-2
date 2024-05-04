.model small
.stack 0100h
.data
.code
main proc
        mov ax, @data
        mov ds, ax

        mov cx, 001Eh
        mov ah, 02h
	  mov dl, 'A'

B:      int 21h
	  inc dl
	  loop B
        mov ax, 4c00h
        int 21h

main endp
end main