DATA SEGMENT
  msgAdd DB 'Addition Result: $'
  msgSub DB 'Subtraction Result: $'
  resultAdd DB 6 DUP(0)  
  resultSub DB 6 DUP(0)  
DATA ENDS

CODE SEGMENT
  ASSUME DS:DATA, CS:CODE
START:
  MOV AX, DATA
  MOV DS, AX

  ; 将数值存入寄存器
  MOV AX, 7890h          
  MOV BX, 1234h          
  MOV CX, 3456h          
  MOV DX, 5678h          

  ; 32位加法
  ; AX = 低16位, DX = 高16位
  MOV DX, AX             
  MOV AX, BX             
  ADD DX, AX             
  ; 观察标志寄存器的状态
  PUSHF                  
  MOV resultAdd[0], DX   
  MOV resultAdd[2], AX   

  ; 显示加法结果消息
  MOV DX, OFFSET msgAdd
  MOV AH, 09H
  INT 21H

  ; 32位减法
  MOV AX, CX             ; AX = 3456h (低位)
  MOV BX, DX             ; BX = 5678h (高位)
  SUB AX, BX             ; AX = 3456h - 5678h
  ; 观察标志寄存器的状态
  PUSHF                  
  MOV resultSub[0], AX   
  MOV resultSub[2], 0    

  ; 显示减法结果消息
  MOV DX, OFFSET msgSub
  MOV AH, 09H
  INT 21H

  ; 结束程序
  MOV AX, 4C00h
  INT 21H

CODE ENDS
END START
