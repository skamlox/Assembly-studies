; NOTE: This file is intended to assemble into a bootsector
org 0; Sets origin for compatibility

bits 16; tells NASM to assemble 16 bit code

mov ah, 0eh; Sets interrupt to Teletype print
mov bh, 0h;  Sets page to 0
mov bl, 4d;  Sets colour to Red on black (not needed since colourless)
mov cx, 1d; Write a single character

mov al, "T"; Set character to be printed to: "T"

int 10h; Teletype the character in al

jmp $; hang system to view results

times 510-($-$$) db 0; pad 0s until byte 510
db 0x55; boot signature byte 1
db 0xAA; boot signature byte 2

