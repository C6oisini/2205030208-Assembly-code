DATA_SEG SEGMENT
    result DB 0        
    DB 9 DUP(0)        
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME CS:CODE_SEG, DS:DATA_SEG

START:
    MOV AX, DATA_SEG
    MOV DS, AX         
    CALL READ_CHAR
    SUB AL, '0'
    MOV BL, AL         
    CALL READ_CHAR
    SUB AL, '0'
    ADD BL, AL         
    MOV DS:[0010H], BL   
    MOV AX, 4C00H
    INT 21H           
READ_CHAR PROC
    MOV AH, 01H        
    INT 21H            
    RET
READ_CHAR ENDP
CODE_SEG ENDS
    END START
