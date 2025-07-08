[org 0x7c00]              ; Tell assembler the code will be loaded at memory address 0x7C00

mov ah, 0x0e              ; Set BIOS teletype mode (print character)
mov al, '>'               ; Load character '>' into AL
int 0x10                  ; Call BIOS interrupt to print character

mov al, '_'               ; Load character '_' into AL
int 0x10                  ; Print '_' to screen

jmp $                     ; Infinite loop (halt the system)

times 510 - ($ - $$) db 0 ; Pad the rest of the boot sector with zeros (up to 510 bytes)
dw 0xaa55                 ; Boot signature (must be last 2 bytes of boot sector)
