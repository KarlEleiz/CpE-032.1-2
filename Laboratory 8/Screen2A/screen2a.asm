dosseg
.model small
.stack 100h

.data
lightBlue db 'Light blue      ', 0
yellow    db '      Yellow       ', 0
magenta   db '      Magenta       ', 0
cyan      db '       Cyan', 0

.code
start:
    mov ax, @data
    mov ds, ax

    mov ax, 0b800h
    mov es, ax

    mov ax, 0003h
    int 10h

    mov ax, 0600h
    mov bh, 11h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h

    mov ax, 0600h
    mov bh, 17h
    mov dh, 24
    mov dl, 19
    int 10h

    mov bh, 11100000b
    mov cl, 20
    mov dl, 39
    int 10h

    mov bh, 01010000b
    mov cl, 40
    mov dl, 59
    int 10h

    mov bh, 30h
    mov cl, 60
    mov dl, 79
    int 10h

    mov ah, 02h
    mov bh, 0
    mov dh, 12

    mov dl, 5
    int 10h
    lea si, lightBlue

    mov ax, 1003h
    mov bx, 0
    int 10h
print_lightBlue:
    lodsb
    cmp al, 0
    je print_yellow
    mov ah, 0Eh
    int 10h
    jmp print_lightBlue

print_yellow:
    lea si, yellow
print_yellow_loop:
    lodsb
    cmp al, 0
    je print_magenta
    mov ah, 0Eh
    int 10h
    jmp print_yellow_loop

print_magenta:
    mov dl, 0
    int 10h
    lea si, magenta
print_magenta_loop:
    lodsb
    cmp al, 0
    je print_cyan
    mov ah, 0Eh
    int 10h
    jmp print_magenta_loop

print_cyan:
    mov dl, 65
    int 10h
    lea si, cyan
print_cyan_loop:
    lodsb
    cmp al, 0
    je done
    mov ah, 0Eh
    int 10h
    jmp print_cyan_loop

done:
    mov ax, 4C00h
    int 21h

end start