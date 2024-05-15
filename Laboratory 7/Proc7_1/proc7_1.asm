.model small
.stack 100h
.data
correct_password db '1234567890$'
entered_password db 11 DUP('$')
msg_enter_password db 13,10,"Enter password (10 characters): $"
msg_correct db 13,10,"Password is CORRECT!$"
msg_incorrect db 13,10,"Password is INCORRECT!$"
newline db 13,10,'$'

.code
main PROC
    mov ax, @data
    mov ds, ax

    lea dx, msg_enter_password
    mov ah, 09h
    int 21h

    mov cx, 10
    lea di, entered_password
    mov byte ptr [di + 10], '$'
read_loop:
    mov ah, 07h
    int 21h
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    inc di
    loop read_loop

    mov byte ptr [di], '$'

    lea dx, newline
    mov ah, 09h
    int 21h

    lea si, correct_password
    lea di, entered_password
    mov cx, 10
compare_loop:
    lodsb
    cmp al, [di]
    jne password_incorrect
    inc di
    loop compare_loop

    jmp password_correct

password_correct:
    lea dx, msg_correct
    mov ah, 09h
    int 21h
    jmp end_program

password_incorrect:
    lea dx, msg_incorrect
    mov ah, 09h
    int 21h

end_program:
    mov ax, 4c00h
    int 21h
main ENDP

end main