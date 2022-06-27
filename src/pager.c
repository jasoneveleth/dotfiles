#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <stdio.h>

// https://stackoverflow.com/questions/1798511/how-to-avoid-pressing-enter-with-getchar-for-reading-a-single-character-only
void buffered(int want_buffered, FILE *file) {
    static struct termios oldt, newt;
    if (!want_buffered) {
        tcgetattr(fileno(file), &oldt);
        newt = oldt;
        newt.c_lflag &= ~(ICANON|ECHO);
        tcsetattr(fileno(file), TCSANOW, &newt);
    } else {
        tcsetattr(fileno(file), TCSANOW, &oldt);
    }
}

// parse commandline input
void parse(int argc, char *argv[], FILE **file, int *mem) {
    if (argc < 2 && isatty(fileno(stdin))) {
        fprintf(stderr, "usage: %s [-N] [-m memory_size] [file]\n", argv[0]);
        exit(0);
    }
    *mem = 1024*1024;
    if (isatty(fileno(stdin))) { // not in pipe
        // create file
        char *path = argv[argc-1];
        if ((*file = fopen(path, "r")) == NULL) {
            fprintf(stderr, "file does not exist\n");
            exit(1);
        }
    } else { // in pipe
        // create file
        int fd = dup(fileno(stdin));
        if (fd == -1) {
            fprintf(stderr, "couldn't duplicate stdin\n");
            exit(1);
        }
        *file = fdopen(fd, "r");

        // replace stdin with keyboard
        if ((freopen("/dev/tty", "r", stdin)) == NULL) {
            fprintf(stderr, "can't open keyboard\n");
            exit(1);
        }
    }
}

// get number of colsumns in terminal
void get_term_info(int *rows, int *cols) {
    struct winsize w;
    if (ioctl(fileno(stdout), TIOCGWINSZ, &w) != -1) {
        *cols = w.ws_col;
        *rows = w.ws_row;
    } else {
        *cols = 78;
        *rows = 1;
    }
}

int main(int argc, char *argv[]) {
    int mem;
    FILE *file;
    parse(argc, argv, &file, &mem);

    int rows, cols;
    get_term_info(&rows, &cols);

    char *buf = malloc(mem);
    fprintf(stdout, "\x1b[?1049h\x1b[0;0H"); // alt screen, go home

    for (int i = 0; i < rows - 2 && fgets(buf, cols+1, file) != NULL; i++)
        fprintf(stdout, "%s", buf); // fill the screen first

    while (1) {
        int at_eof = fgets(buf, cols+1, file) == NULL;
        if (!at_eof)
            fprintf(stdout, "%s", buf);
        fprintf(stdout, ":"); // prompt

        buffered(0, stdin);
        if (getc(stdin) == 'q') break;
        buffered(1, stdin);

        fprintf(stdout, "\x1b[2K\r"); // clear line, go to col 0
    }
    buffered(1, stdin);
    fprintf(stdout, "\x1b[?1049l"); // alt screen
    free(buf);
    return 0;
}
