.model small
.stack 100h
.data
    message db 'Hello World!', 0ah, 0dh, '$' 

.code

main proc
    mov ax, @data    
    mov ds, ax        

    lea dx, message  
    mov ah, 09h       
    int 21h           

    mov ah, 00h      
    int 21h          

    mov ax, 4c00h     
    int 21h           

main endp
end main
