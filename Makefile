#  Main targets can be executed directly, and they are:
#
#     compile                  compile .c file into .o
#     clean                    remove compile files
#     link                     create executable from all .o specified
#     all                      build
#     help                     print help mesage
#

# Environment
CC = gcc
EXE_NAME = executable
FILE = test.txt
TEST-EXE_NAME = testexec
OBJS = commande.o inode.o filesystem.o
C= commande.c inode.c filesystem.c
TEST-OBJS = commande.o inode.o filesystem.o
HELP = readme.txt

.SUFFIXES: .c .o

# all-------------------------------
all: link start

#link for program-------------------
link: compile
	$(CC) $(OBJS) -o $(EXE_NAME)

#link for test----------------------
test-link: test-compile
	$(CC) $(TEST-OBJS) -o $(TEST-EXE_NAME)

# compile---------------------------
compile: $(OBJS)

test-compile: $(TEST-OBJS)

.c.o:
	$(CC) -Wall -c $*.c

debug: $(OBJS)
	$(CC) -g -c $(C)
	gdb $(EXE_NAME)

# clean-----------------------------
clean:
	rm $(EXE_NAME)
	rm $(OBJS)

test-clean:
	rm $(TEST-EXE_NAME)
	rm $(TEST-OBJS)

#run program------------------------
start: link
	./$(EXE_NAME) $(FILE)

# run tests-------------------------
test:  test-link
	./$(TEST-EXE_NAME)
# help------------------------------
help:
	less $(HELP)


#=======================================
