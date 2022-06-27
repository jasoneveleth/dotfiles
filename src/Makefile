# C compiler
CC = clang
CFLAGS = -Wall -std=c99 -Wextra -Wpedantic -Werror
CFLAGS += -pthread
CFLAGS += -O3
# CFLAGS += -g -O0

BIN = ../bin/.local/bin/c
SOURCE = .

EXECS = donut pager rand eps prompt
# https://stackoverflow.com/questions/9178285/how-can-makefile-use-separate-directories-for-source-code-and-binaries/46334872
LIST = $(addprefix $(BIN)/, $(EXECS))

.PHONY: all clean

all: $(LIST)

$(BIN)/prompt: prompt.c
	$(CC) $< $(CFLAGS) -L/opt/homebrew/opt/readline/lib -lreadline -o $@

$(BIN)/%: $(SOURCE)/%.c
	$(CC) $< $(CFLAGS) -o $@

clean:
	rm -vf $(addprefix $(BIN)/, $(EXECS))
	rm -rvf *.dSYM
