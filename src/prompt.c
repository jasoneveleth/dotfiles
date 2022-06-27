#include <string.h>
#include <unistd.h>
#include <readline/readline.h>

char *prefill = "";

int startup_hook() {
    if (prefill) {
        return rl_insert_text(prefill);
    } 
    return 0;
}

// get value for flag
char *arg(int argc, char **argv, char *flag) {
    for (int i = 0; i < argc; i++) {
        if (!strcmp(argv[i], flag)) {
            if (i < argc) {
                return argv[i+1];
            }
        }
    }
    return "";
}

int main(int argc, char** argv)
{
    if (!strcmp(argv[1], "--help")) {
        printf("usage: %s [-p PROMPT] [-i PREFILL]\n", argv[0]);
        return 0;
    }

    // prompt and prefill from commandline
    char *prompt = arg(argc, argv, "-p");
    if (*prompt == '\0') prompt = ">";
    prefill = arg(argc, argv, "-i");

    // cast because functions hooks are supposed to take (char *, int)
    rl_startup_hook = (Function *)startup_hook;

    // use stderr if stdout redirected
    if(!isatty(STDIN_FILENO)) {
        rl_outstream = stderr;
    }

    char *line = readline(prompt);
    puts(line);
    return 0;
}

