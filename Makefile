help:
	@echo "assembles a .asm file to specified file type"
	@echo "supported output types are:"
	@echo ".com for DOS (requires org 100h at start for compatibility)"
	@echo "Syntax is:"
	@echo "make outputtype in=file.asm out=file.extension"

com:
	@nasm -f bin -o $(out) $(in)
