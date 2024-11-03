DATA SEGMENT
    msg_input db 'Please enter a 7-digit binary number (end with a carriage return):$' 
    char_output db 'The corresponding character is: $'  
    binary_input db 8 dup(0)   
    output_char db 0           
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA  

main proc
    mov ax, DATA        
    mov ds, ax          

read_binary:
    mov dx, offset msg_input  
    mov ah, 09h               
    int 21h                   

    mov si, 0                 
    mov cx, 7                 

next_bit:
    mov ah, 01h               
    int 21h                   
    cmp al, 13                
    je exit_program           
    cmp al, '0'               
    je store_zero             
    cmp al, '1'               
    je store_one              
    jmp next_bit              

store_zero:
    mov binary_input[si], 0     
    jmp store_next              

store_one:
    mov binary_input[si], 1     

store_next:
    inc si                      
    loop next_bit               

    xor ax, ax                  
    mov cx, 7                   

convert_binary:
    dec si                      
    mov bl, binary_input[si]    
    shl ax, 1                   
    or ax, bl                   
    loop convert_binary         

    add ax, '0'                 
    mov output_char, al         

    mov dx, offset char_output  
    mov ah, 09h                 
    int 21h                     

    mov al, output_char         
    call print_char             

    jmp read_binary             

print_char:
    mov dl, al                  
    mov ah, 02h                 
    int 21h                     
    ret                         

exit_program:
    mov ax, 4C00h               
    int 21h                     
main endp
CODE ENDS
end main
