%include "macro_basic.asm"

org 100h; DOS .COM compatibility

ifgt 1 2 correct; checks if 1 > 2
ret
correct:
print "The 'ifgt' statement worked!"; This should only be run if the ifgt statement worked correctly
ret
