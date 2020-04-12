org 0; boot compatibility

bits 16; sets 16-bit CPU mode

; sets video mode
	mov ax,0013h
	int 10h
	
; configures drawing routines
	mov ah,0ch
	mov al,78d
	mov bx,0000h
	mov dx,0000d
	mov cx,0000d
	
forloop: ; for loop in assembly
	
	; Do
		int 10h
		inc cx
		
	; Comparisons
		cmp dx,200d
		jge ender
		
		cmp cx,320
		jge checkall

		jmp forloop
		
ender: ; halts all activity after rendering flag
	cli
	hlt
	
checkall:
	cmp dx,40d
	je setpink
	cmp dx,80d
	je setwhite
	cmp dx,120d
	je setpink
	cmp dx,160d
	je setblue
	jmp resetx

resetx:
	mov cx,0000d
	inc dx
	jmp forloop

setpink:
	mov al,85d
	jmp resetx

setwhite:
	mov al,31d
	jmp resetx

setblue:
	mov al,78d
	jmp resetx

times 510-($-$$) db 0
db 0x55
db 0xAA

