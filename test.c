#include <unistd.h>
#include <sys/syscall.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
  int input = open(argv[1], O_RDONLY);
  int temp1 = open("/tmp/copy_file_range_test", O_WRONLY|O_CREAT|O_TRUNC, 0100644);

  syscall(SYS_copy_file_range, input, NULL, temp1, NULL, 6, 0);

  close(input);
  close(temp1);

  int temp2 = open("/tmp/copy_file_range_test", O_RDONLY);
  int dest = open("destination", O_WRONLY|O_CREAT|O_TRUNC, 0100644);

  syscall(SYS_copy_file_range, temp2, NULL, dest, NULL, 6, 0);

  close(temp2);
  close(dest);
}
