DATA SEGMENT
  message DB "Hello World, My Name Is Wxaiohan .$"
DATA ENDS
CODE SEGMENT
  ASSUME DS:DATA, CS:CODE
START:
  MOV AX, DATA
  MOV DS, AX
  MOV DX, OFFSET message
  MOV AH, 09H
  INT 21H
  MOV DL, DS:[message+25]
  LEA BX, message
  MOV DH, [BX+25]
  MOV BP, OFFSET message
  MOV SI, 25
  MOV BH, DS:[BP+SI]
  MOV BX, OFFSET message
  MOV SI, 25
  MOV AL, [BX+SI]
  MOV BL, AL
  MOV DI, 25
  MOV CL, DS:[message+DI]
  MOV AH, 4CH
  INT 21H
CODE ENDS
  END START
