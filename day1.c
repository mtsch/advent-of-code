#include <stdio.h>

// za ogrevanje preprosta rešitev v C-ju
int main(int argc, char **argv)
{
  char *str = argv[1];
  int res = 0;
  int i = 0;

  while (str[i] != '\0') {
    switch(str[i]) {
      case '(': res++; break;
      case ')': res--; break;
    }
    i++;
  }
  printf("%d\n", res);

  return 0;
}
