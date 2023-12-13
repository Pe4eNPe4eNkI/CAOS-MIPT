#include <fcntl.h>
#include <unistd.h>
#include <ctype.h>
#define BUF_SIZE 1024

int main(int argc, char *argv[]) {
    int end_inp = open(argv[1], O_RDONLY);
    if (end_inp == -1) {
        return 1;
    }

    int first_out = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    int second_out = open(argv[3], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (first_out == -1 || second_out == -1) {
        return 2;
    }

    char buf[BUF_SIZE];
    ssize_t text;
    while ((text = read(end_inp, buf, BUF_SIZE)) > 0) {
        for (ssize_t i = 0; i < text; ++i) {
            if (!isdigit(buf[i])) {
                if (write(second_out, &buf[i], 1) != 1) {
                    return 3;
                }
            } else {
                if (write(first_out, &buf[i], 1) != 1) {
                    return 3;
                }
            }
        }
    }
    if (text == -1) {
        return 3;
    }

    close(end_inp);
    close(first_out);
    close(second_out);

    return 0;
}