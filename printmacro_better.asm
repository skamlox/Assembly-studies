%macro print 1; Prints a string with the DOS API
	jmp %%printmacro_code
	%%printmacro_string:
	db %1
	db 10
	db "$"
	%%printmacro_code:
	mov ax,0900h
	mov dx, %%printmacro_string
	int 21h
%endmacro

%macro print$ 1; Prints a string with the DOS API, no newline
	jmp %%printmacro_code
	%%printmacro_string:
	db %1
	db "$"
	%%printmacro_code:
	mov ax,0900h
	mov dx, %%printmacro_string
	int 21h
%endmacro


org 100h ; For DOS .com compatibility
print "This has a newline, see!"
print$ "This has no newline."
print$ " This is a 3rd print statement."
ret ; Returns to DOS
