#include <stdio.h>

int foo(void) __attribute__((warn_unused_result));

int foo(void)
{
  return 1;
}

int main(void)
{
  foo();
  return 0;
}
