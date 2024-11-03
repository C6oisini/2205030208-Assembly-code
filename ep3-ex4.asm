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

    ; ��ʾ������ʾ��Ϣ
    mov dx, offset msg_input
    mov ah, 09h
    int 21h

    ; ��ȡ�û�����
    mov ah, 01h
    int 21h
    sub al, '0'               ; ��������ַ�ת��Ϊ����
    cmp al, 1
    jb exit_program           ; ���С��1�����˳�����
    cmp al, 8
    ja exit_program           ; �������8�����˳�����


    ; ������ת�������ƫ����
    dec al                    ; ������������Ϊ�������Ǵ�0��ʼ�ģ�
    mov bx, ax                ; �������Ƶ�bx�Ĵ���
    mov bh, 0
    shl bx, 1                 ; ����2����Ϊ�������еĵ�ַ���ִ�С��
    mov bx, [jumpTable + bx]  ; ��ȡ��ת��ַ

    ; ��ת����Ӧ���ӳ���
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
