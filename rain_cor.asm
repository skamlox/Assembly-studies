org 100h; for .com compatibility

; sets video mode
	mov ax,0013h
	int 10h
	
; configures drawing routines
	mov ah,0ch
	mov al,32d
	mov bx,0000h
	mov dx,0000d
	mov cx,0000d
	
forloop: ; for loop in assembly
	
	; Do
		
		int 10h
		inc cx
		inc al
		
	; Comparisons
		
		cmp al,55d
		jge resetcol
		
		cmp cx,320
		jge resetx
		
		cmp dx,200d
		jge ender
		
		jmp forloop
		
ender: ; hangs the system to view results
	jmp $
	
	resetcol:
	mov al,32d
	jmp forloop
	
	resetx:
	mov cx,0000d
	mov al,32d
	inc dx
	jmp forloop

