/*
  Copyright (c) 2019, Alexey Frunze
  2-clause BSD license.
*/

// Before including this file define DLL and FXN, e.g.:
//
// #define DLL "sdl2"
// #define FXN "SDL_Init"
// #include "dimports.h"

asm(
" section .dll_import2_" DLL " write align=4\n"
"     dd _hint_" FXN "\n"

" section .dll_import3_" DLL " write align=2\n"
" _hint_" FXN ":\n"
"     db 0, 0, \"" FXN "\", 0\n"
"     align 2, db 0\n"

" section .dll_iat2_" DLL " write align=4\n"
"     global _" FXN "\n"

// Note that DLL importing gives us pointers to functions.
// SDL2 is compiled using the cdecl calling convention (same as in Smaller C)
// and so we can just use those pointers directly to call SDL functions.
" _" FXN ":\n"
"     dd _hint_" FXN "\n"
);
