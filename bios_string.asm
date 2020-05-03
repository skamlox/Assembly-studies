; NOTE: This file is intended to assemble into a bootsector
org 0; Sets origin for compatibility

bits 16; tells NASM to assemble 16 bit code

mov ah, 0eh; Sets interrupt to Teletype print
mov bh, 0h;  Sets page to 0
mov bl, 4d;  Sets colour to Red on black (is normally left white due to non-graphical mode)
mov cx, 1d; Write a single character

mov [which_char], main_str; point to start of string

main_loop:





int 10h; Teletype the character in al
inc [which_char]; increment address of which character is being read
mov [which_char], al; move the character into al


cmp al, 0
jne main_loop

jmp $; hang system to view results, also stop CPU running into data

main_str: db "Testing 1 2 3"; Main string, to be printed.
db 0d; terminate string

which_char: db 219d

times 510-($-$$) db 0; pad 0s until byte 510
db 0x55; boot signature byte 1
db 0xAA; boot signature byte 2

