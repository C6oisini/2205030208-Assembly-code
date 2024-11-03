DATA SEGMENT
    ARRAY db 5, -3, 8, -1, 0, 12, -4
    ARRAY_SIZE db 7                 
    PDATA db 7 dup(0)               
    NDATA db 7 dup(0)               
    positive_count db 0             
    negative_count db 0             
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

main proc
    mov ax, DATA                    
    mov ds, ax                      
    mov si, 0                       
    mov di, 0                       
    mov bx, 0                       
    mov cl, ARRAY_SIZE              

split_loop:
    mov al, ARRAY[si]               
    cmp al, 0                       
    jge store_positive              
    jmp store_negative              

store_positive:
    mov PDATA[di], al               
    inc di                          
    inc positive_count              
    jmp next_element

store_negative:
    mov NDATA[bx], al               
    inc bx                          
    inc negative_count              

next_element:
    inc si                          
    loop split_loop                 
    mov al, positive_count           
    mov ah, negative_count           
    ; 退出程序
    mov ax, 4C00h                   
    int 21h                         

main endp
CODE ENDS
end main
