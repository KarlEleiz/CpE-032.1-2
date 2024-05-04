.model small
.stack 100h
.data
    cx_value dw 0       
    asterisk db '*'     

.code

main proc
    mov ax, @data   
    mov ds, ax         

    mov cx, 0          
    mov cx_value, cx   

for_loop:
    mov cx, cx_value   
    cmp cx, 5          
    jge end_for        
    
    
    mov ah, 02h        
    mov dl, asterisk   
    int 21h            

    
    inc cx             
    mov cx_value, cx   

    jmp for_loop       

end_for:
    
    mov ah, 00h        
    int 21h            

    mov ax, 4c00h      
    int 21h            

main endp
end main
