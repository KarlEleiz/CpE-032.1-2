.model small
.stack 100h

.data
    prompt1 db 13,10,"Hello, what's your name? $"
    prompt2 db "Hello, $"
    prompt3 db 13,10,"Congratulations! Your first program is working!$"
    prompt4 db 24 dup("$")
    prompt5 db 13,10,"$"

.code
Start:
    Mov ax, @data
    mov ds, ax
    mov es, ax
    mov ah, 00h
    int 10h

    mov dx, offset prompt1
    mov ah, 09h
    int 21h

    mov byte ptr prompt4, 30
    mov dx, offset prompt4
    mov ah, 0Ah
    int 21h

    mov dx, offset prompt5
    mov ah, 09h
    int 21h

    mov dx, offset prompt2
    mov ah, 09h
    int 21h

    mov si, 002
    lea dx, prompt4[SI]
    mov ah, 09h
    int 21h

    mov dx, offset prompt3
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h
end Start
