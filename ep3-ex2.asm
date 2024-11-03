.model small
.stack 100h

DATA SEGMENT
    msg_input db 'Please enter (A-Z, a-z, 0-9), press Enter to quit:$'
    msg_output db 'Output: $'
    newline db 0Dh, 0Ah, '$'  
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

main proc
    mov ax, DATA
    mov ds, ax

input_loop:
    mov dx, offset msg_input
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al            ; ???????? BL ?


    cmp al, 0Dh
    je exit_program        ; ?????????????


    cmp bl, 'A'           
    jb check_lowercase     ; ???? 'A'???????
    cmp bl, 'Z'
    jbe to_lowercase       ; ??? 'A' ? 'Z' ????????????

check_lowercase:
    cmp bl, 'a'           
    jb check_digit         ; ???? 'a'??????????
    cmp bl, 'z'
    jbe to_uppercase       ; ??? 'a' ? 'z' ????????????

check_digit:

    jmp print_output       ; ???????

to_lowercase:
    add bl, 20h            ; ???????
    jmp print_output

to_uppercase:
    sub bl, 20h            ; ???????
    jmp print_output

print_output:

    mov dx, offset msg_output
    mov ah, 09h
    int 21h

    mov dl, bl             ; ? BL ??????? DL
    mov ah, 02h
    int 21h                ; ????


    mov dx, offset newline
    mov ah, 09h
    int 21h


    jmp input_loop

exit_program:
    ; ????
    mov ax, 4C00h
    int 21h

main endp
CODE ENDS
end main
