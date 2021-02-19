
#include <stdio.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
  int temp = openat(AT_FDCWD, "/tmp/copy_file_range_test", O_RDWR|O_CREAT|O_EXCL|O_CLOEXEC, 0600);
  int input = openat(AT_FDCWD, argv[1], O_RDONLY|O_CLOEXEC);
  int temp2 = openat(AT_FDCWD, "/tmp/copy_file_range_test", O_WRONLY|O_CREAT|O_TRUNC|O_CLOEXEC, 0100644);
  lseek(input, 0, SEEK_CUR);
  syscall(SYS_copy_file_range, input, NULL, temp2, NULL, 6, 0);
  close(temp2);
  close(input);
  close(temp);
  int temp3 = openat(AT_FDCWD, "/tmp/copy_file_range_test", O_RDWR|O_CLOEXEC);
  int dest = openat(AT_FDCWD, "destination", O_WRONLY|O_CREAT|O_NOCTTY|O_TRUNC|O_CLOEXEC, 0666);
  lseek(temp3, 0, SEEK_CUR);
  syscall(SYS_copy_file_range, temp3, NULL, dest, NULL, 6, 0);
  close(dest);
  // rt_sigaction...
  unlink("/tmp/copy_file_range_test");
  close(temp3);




  // FILE* infile = fopen(argv[1], "r");
  // FILE* outfile = fopen("destination", "w");
  // syscall(SYS_copy_file_range, fileno(infile), NULL, fileno(outfile), NULL, 6, 0);
}
