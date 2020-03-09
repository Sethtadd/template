# template makefile

# file names
EXE    := hellomake
CC     := gcc
CFLAGS := 
DEPS   := hellomake.h
OBJ    := hellomake.o hellofunc.o

# directories
SRCDIR := src
INCDIR := include
OBJDIR := build
BINDIR := bin

# add directory prefixes
EXE  := $(BINDIR)/$(EXE)
DEPS := $(patsubst %, $(INCDIR)/%, $(DEPS))
OBJ  := $(patsubst %, $(OBJDIR)/%, $(OBJ))

# add include directory to compiler arguments
CFLAGS := -I./$(INCDIR)

# OS-specific settings
ifeq ($(OS), Windows_NT) # run this Makefile on Windows with MSYS, Cygwin, etc.
    LIBS     = 
    CLEANEXE = rm -v $(EXE).exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S), Linux) # Linux
        LIBS     = 
    endif
    ifeq ($(UNAME_S), Darwin) # MacOS
        LIBS     = 
    endif
    CLEANEXE = rm -v $(EXE) # for both Linux and MacOS
endif

# rules
make: $(OBJ)
	@mkdir -p $(BINDIR)
	$(CC) -o $(EXE) $^ $(CFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	@mkdir -p $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -v $(OBJ)
	$(CLEANEXE)
