DATA SEGMENT
    msg_input db 'Please enter a character:$'  
    msg_output db 'The ASCII code of the character is:$' 
    ascii db '00$'  
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA  

main proc
    mov ax, DATA          
    mov ds, ax            

read_char:
    mov dx, offset msg_input  
    mov ah, 09h               
    int 21h                   

    mov ah, 01h               
    int 21h                   

    cmp al, 13                
    je exit_program           

    mov ah, 0                 
    mov bx, ax                
    mov cx, 0                 
    mov ax, bx                
    call to_hex               

    mov dx, offset msg_output 
    mov ah, 09h               
    int 21h                   

    mov dx, offset ascii      
    mov ah, 09h               
    int 21h                   

    jmp read_char             

to_hex:
    mov dx, 0                 
    mov di, 2                 
    mov bx, 16                

hex_loop:
    xor dx, dx                
    div bx                    
    add dl, '0'               
    cmp dl, '9'               
    jbe store_digit           
    add dl, 7                 

store_digit:
    dec di                    
    mov ascii[di], dl         
    test ax, ax               
    jnz hex_loop              
    ret                       

exit_program:
    mov ax, 4C00h             
    int 21h                   
main endp
CODE ENDS
end main
