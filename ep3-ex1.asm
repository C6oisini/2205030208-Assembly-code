DATA SEGMENT
    ORG 2000H            ; 设置偏移地址为 2000H
    TABLE DW 6050H, 8090H
DATA ENDS

CODE SEGMENT
START:
    MOV AX, 4000H
    MOV DS, AX          ; DS = 4000H

    ; 设置 BX 为 2000H
    MOV BX, 2000H       ; BX = 2000H
    MOV DS:[2000H], 6050H
    MOV DS:[4000H], 8090H
    ; 第一条指令
    ; JMP BX              ; 跳转到段内偏移 2000H，IP = 2000H

    ; 第二条指令
    JMP WORD PTR DS:[BX] ; 从 DS:2000H 读取跳转地址，IP = 6050H

    ; 第三条指令
    ; JMP DS:[TABLE]     ; 跳转到 TABLE 的偏移地址，IP = 6050H

    ; 第四条指令
    ; JMP DS:[TABLE+BX]  ; 从 DS:2000H 读取跳转地址，TABLE[BX] 的实际值为 8090H，IP = 8090H

CODE ENDS
END START
