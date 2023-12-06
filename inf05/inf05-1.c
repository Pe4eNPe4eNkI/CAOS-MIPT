#include <fcntl.h>
#include <stdint.h>
#include <unistd.h>
#include <stdio.h>

struct Item {
  int value;
  uint32_t next_pointer;
};

int main(int arc, char* argv[]) {
  int fd = open(argv[1], O_RDONLY);
  struct Item item;

  while (0 < read(fd, &item, sizeof(struct Item))) {
    printf("%d ", item.value);
    if (item.next_pointer != 0) {
      lseek(fd, item.next_pointer, SEEK_SET);
    } else {
      break;
    }
  }
  close(fd);
  
  return 0;
}