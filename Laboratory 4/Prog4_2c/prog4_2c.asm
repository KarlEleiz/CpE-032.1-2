.model small
.stack 100h
.data
    cx_value dw 1      

.code

main proc
    mov ax, @data     
    mov ds, ax       

    call print        

   
    mov ah, 00h        
    int 21h            

    mov ax, 4c00h     
    int 21h            

main endp

print proc
    mov cx, cx_value   
for_loop:
    cmp cx, 6          
    jge end_for       

   
    mov ah, 02h        
    mov dl, '*'      
    int 21h            

  
    inc cx             

    jmp for_loop      

end_for:
    ret
print endp

end main
