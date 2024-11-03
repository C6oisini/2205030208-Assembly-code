DATA SEGMENT
    MSG1 DB 'Enter four hexadecimal digits$'  
    MSG2 DB 'Input not legal$'                
    HOUZHUI DB 'B$'                           
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA                   
START:
    MOV AX, DATA                              
    MOV DS, AX                                
    MOV CX, 0504H                             

    LEA DX, MSG1                              
    MOV AH, 09H                               
    INT 21H                                   
    MOV DL, 0DH                               
    MOV AH, 2                                 
    INT 21H                                   
    MOV DL, 0AH                               
    MOV AH, 2                                 
    INT 21H                                   

INPUT:
    MOV AH, 01H                               
    INT 21H                                   
    DEC CH                                    
    CALL JUDGE                                
    CMP AL, 39H                               
    JBE NEXT                                  

    SUB AL, 07H                               

NEXT:
    SUB AL, 30H                               
    SHL BX, CL                                
    ADD BL, AL                                
    CMP CH, 0                                 
    JNE INPUT                                 

    MOV CX, 16                                

BACK:
    MOV DL, 0DH                               
    MOV AH, 2                                 
    INT 21H                                   
    MOV DL, 0AH                               
    MOV AH, 2                                 
    INT 21H                                   
    MOV CX, 16                                

OUTPUT:
    MOV DL, 0                                 
    ROL BX, 1                                 
    ADC DL, 30H                               
    MOV AH, 02H                               
    INT 21H                                   
    LOOP OUTPUT                               

    LEA DX, HOUZHUI                           
    MOV AH, 09H                               
    INT 21H                                   

    MOV AH, 4CH                               
    INT 21H                                   

WRONGINPUT PROC NEAR                          
    LEA DX, MSG2                              
    MOV AH, 09H                               
    INT 21H                                   
    MOV DL, 0DH                               
    MOV AH, 2                                 
    INT 21H                                   
    MOV DL, 0AH                               
    MOV AH, 2                                 
    INT 21H                                   
    RET                                       
WRONGINPUT ENDP

JUDGE PROC NEAR                               
    CMP CH, 0                                 
    JE S2                                     
    CMP AL, 30H                               
    JB WRONG                                  
    CMP AL, 39H                               
    JA S0                                     
    RET                                       

S0:
    CMP AL, 41H                               
    JB WRONG                                  
    CMP AL, 46H                               
    JA S1                                     
    RET                                       

S1:
    CMP AL, 61H                               
    JB WRONG                                  
    CMP AL, 66H                               
    JA WRONG                                  

    SUB AL, 20H                               
    RET                                       

WRONG:
    CALL WRONGINPUT                           
    JMP START                                 

S2:
    CMP AL, 68H                               
    JE BACK                                   
    CMP AL, 48H                               
    JE BACK                                   
    JMP WRONG                                 
JUDGE ENDP

CODE ENDS
    END START
