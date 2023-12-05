#include <unistd.h>
#include <sys/syscall.h>

void _start() {
    char buf;
    int flag = syscall(SYS_read, 0, &buf, 1);
    while (flag > 0) {
        syscall(SYS_write, 1, &buf, 1);
        flag = syscall(SYS_read, 0, &buf, 1);
    }
    syscall(SYS_exit, 0);
}