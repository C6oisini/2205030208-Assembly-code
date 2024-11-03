DATA SEGMENT
    X DW 0004H
    Y DW 0002H
    Z DW 0014H
    V DW 0018H
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA       
    MOV DS, AX
    MOV AX, V          
    ADD AX, Z          
    MOV BX, X          
    SUB BX, Y          
    IMUL BX            
    SUB AX, 16         
    CWD                
    IDIV X             
    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
