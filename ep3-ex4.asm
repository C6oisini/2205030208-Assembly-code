DATA SEGMENT
    msg_input db 'Please enter a number (1-8):$'
    msg_p1 db 'You chosen.P1$'
    msg_p2 db 'You chosen.P2$'
    msg_p3 db 'You chosen.P3$'
    msg_p4 db 'You chosen.P4$'
    msg_p5 db 'You chosen.P5$'
    msg_p6 db 'You chosen.P6$'
    msg_p7 db 'You chosen.P7$'
    msg_p8 db 'You chosen.P8$'
    jumpTable dw P1, P2, P3, P4, P5, P6, P7, P8
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

main proc
    mov ax, DATA
    mov ds, ax

    ; 显示输入提示信息
    mov dx, offset msg_input
    mov ah, 09h
    int 21h

    ; 获取用户输入
    mov ah, 01h
    int 21h
    sub al, '0'               ; 将输入的字符转换为数字
    cmp al, 1
    jb exit_program           ; 如果小于1，则退出程序
    cmp al, 8
    ja exit_program           ; 如果大于8，则退出程序


    ; 计算跳转向量表的偏移量
    dec al                    ; 调整索引（因为向量表是从0开始的）
    mov bx, ax                ; 将数字移到bx寄存器
    mov bh, 0
    shl bx, 1                 ; 乘以2，因为向量表中的地址是字大小的
    mov bx, [jumpTable + bx]  ; 获取跳转地址

    ; 跳转到相应的子程序
    jmp bx

end_program:
    mov ax, 4C00h
    int 21h
    ret

P1:
    mov dx, offset msg_p1
    mov ah, 09h
    int 21h
    jmp end_program

P2:
    mov dx, offset msg_p2
    mov ah, 09h
    int 21h
    jmp end_program

P3:
    mov dx, offset msg_p3
    mov ah, 09h
    int 21h
    jmp end_program

P4:
    mov dx, offset msg_p4
    mov ah, 09h
    int 21h
    jmp end_program

P5:
    mov dx, offset msg_p5
    mov ah, 09h
    int 21h
    jmp end_program

P6:
    mov dx, offset msg_p6
    mov ah, 09h
    int 21h
    jmp end_program

P7:
    mov dx, offset msg_p7
    mov ah, 09h
    int 21h
    jmp end_program

P8:
    mov dx, offset msg_p8
    mov ah, 09h
    int 21h
    jmp end_program

exit_program:
    mov ax, 4C00h
    int 21h
main endp
CODE ENDS
end main
