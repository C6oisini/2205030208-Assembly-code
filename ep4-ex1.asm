.model small
.stack 100h

DATA SEGMENT
    MESS DB 'This is an example string.$'  
    LENGTH EQU ($ - MESS - 1)              
    NO DB 'No space found.$'               
    YES DB 'Find space.$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

main proc
    mov ax, DATA                     
    mov ds, ax                       

    lea si, MESS                     
    mov cx, LENGTH                   

search_space:
    mov al, [si]                     
    cmp al, 20H                      
    je found_space                   
    inc si                           
    loop search_space                

    jmp no_space                     

found_space:
    ; 输出找到空格的消息
    lea dx, YES                      
    mov ah, 09h                      
    int 21h                          
    jmp end_program                  

no_space:
    ; 输出没有找到空格的消息
    lea dx, NO                       
    mov ah, 09h                      
    int 21h                          

end_program:
    mov ax, 4C00h                    
    int 21h

main endp
CODE ENDS
end main
