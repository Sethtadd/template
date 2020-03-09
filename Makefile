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

make: $(OBJ)
	@mkdir -p $(BINDIR)
	$(CC) -o $(EXE) $^ $(CFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	@mkdir -p $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -v $(OBJ)
	rm -v $(EXE)

