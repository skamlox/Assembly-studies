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

%define goto jmp; makes the GOTO command, execute the JMP instruction

%macro ifgt 3; If parameter 1 is greater than 2, jump to paramater 3 (IF X > Y THEN GOTO Z)
	cmp %1, %2
	jg %3
%endmacro
