# lex file name
LEXNAME = Parser.l 

# Compiler Flags
CFLAGS = -g -Wall -Wextra -Wunused-parameter -Wunused-variable -Wuninitialized -Wpedantic -Wconversion -Wfloat-equal -Wshadow -Wmissing-prototypes -Wmissing-prototypes -Wstrict-prototypes -Wcast-qual -Wcast-align -Wformat=2 -Wunreachable-code -Wsign-conversion
#Linker Flags

LIB = -lfl

LIBPATH = -L/opt/homebrew/opt/flex/lib

# C standard
STD=c2x

#Executable name
ASSEMBLY = out

.PHONY: build clean run lex macro_out

.Default_Goal := clean

run: build
	./$(ASSEMBLY)

build: lex
	clang lex.yy.c -std=$(STD) $(CFLAGS) $(LIBPATH) $(LIB) -o $(ASSEMBLY)

lex: clean
	lex $(LEXNAME)

clean:
	rm -f $(ASSEMBLY)
	rm -f lex.yy.c

macro_out: 
	clang -E lex.yy.c -o preprocessed_file.c
	
