DATA SEGMENT
    ORG 0
    ARRAY LABEL BYTE 
    DA1 DW 2, 9, 14, 3, 315H, -6     
    DA2 DB 7, 'ABCDEDFG'             
    LEN EQU $ - DA2                  
    ORG 100H                         
    DA3 DW DA4                       
    DA4 DB 4 DUP (2 DUP (1, 2, 3), 4) 
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AL, ARRAY + 2           
    ADD AL, DA2 + 1             
    MOV AX, DA2 - DA1          
    MOV BL, LEN                 

    MOV AX, DA3                  
    MOV BX, TYPE DA4             
    MOV BX, OFFSET DA4           
    MOV CX, SIZE DA4             
    MOV DX, LENGTH DA4           
    MOV BX, WORD PTR DA4         
    MOV BL, LEN AND 0FH          
    MOV BL, LEN GT 5             
    MOV AX, LEN MOD 5            

    INT 20H                       
CODE ENDS
END START
