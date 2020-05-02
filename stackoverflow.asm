org 0
bits 16
overflow: push 0
jmp overflow

times 510-($-$$) db 0
db 0x55
db 0xAA
