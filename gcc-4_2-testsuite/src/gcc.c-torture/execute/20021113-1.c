/* This program tests a data flow bug that would cause constant propagation
   to propagate constants through function calls.  */
#include <stdlib.h>

foo (int *p)
{
  *p = 10;
}

main()
{
  int *ptr = alloca (sizeof (int));
  *ptr = 5;
  foo (ptr);
  if (*ptr == 5)
    abort ();
  exit (0);
}
