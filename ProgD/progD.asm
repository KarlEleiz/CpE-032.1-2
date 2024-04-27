.model small
.stack 100h

.data
    src_byte db 1
    dest_byte db 0
    src_word dw 1234h
    dest_word dw 0
    src_string db "Stressed!", 0dh, 0ah, "$"
    ;---- this is a comment

.code
MAIN PROC
    Mov ax, @data
    Mov ds, ax

    Mov dx, offset src_string
    Mov ah, 9
    Int 21h

    Mov bx, offset src_string

    Mov al, [bx]
    Mov ah, [bx+8]
    Mov [bx], ah
    Mov [bx+8], al

    Mov al, [bx+1]
    Mov ah, [bx+7]
    Mov [bx+1], ah
    Mov [bx+7], al

    Mov al, [bx+2]
    Mov ah, [bx+6]
    Mov [bx+2], ah
    Mov [bx+6], al

    Mov al, [bx+3]
    Mov ah, [bx+5]
    Mov [bx+3], ah
    Mov [bx+5], al

    Mov ah, 9
    Mov dx, offset src_string
    Int 21h

    Mov ax, 4c00h
    Int 21h
MAIN endp
End MAIN
