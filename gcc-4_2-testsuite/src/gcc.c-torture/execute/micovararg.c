// Test mico32 varargs. Tries to trigger transition from register
// arguments to sack arguments.

typedef long unsigned int size_t;
extern void abort (void);
typedef __builtin_va_list va_list;

int g1 (int cnt, ...)
{
  int sum = 0;
  int i;
  va_list ap;
  __builtin_va_start (ap, cnt);
  int val;

  for (i=0; i < cnt; i++) {
      val = __builtin_va_arg (ap, int) ;
      if (val != i + 1) abort();
      sum += val;
  }

  __builtin_va_end (ap);

  return sum;
}

int g8 (int cnt, int a1, int a2, int a3, int a4, int a5, int a6, int a7,  ...)
{
  int sum = 0;
  int i;
  va_list ap;
  __builtin_va_start (ap, cnt);
  int val;

  for (i=0; i < cnt; i++) {
      val = __builtin_va_arg (ap, int) ;
      if (val != i + 1) abort();
      sum += val;
  }

  __builtin_va_end (ap);

  return sum;
}

int ga (int cnt, int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9,  ...)
{
  int sum = 0;
  int i;
  va_list ap;
  __builtin_va_start (ap, cnt);
  int val;

  for (i=0; i < cnt; i++) {
      val = __builtin_va_arg (ap, int) ;
      if (val != i + 1) abort();
      sum += val;
  }

  __builtin_va_end (ap);

  return sum;
}


int g4 (int cnt, int a, int b, int c, ...)
{
  int sum = 0;
  int i;
  va_list ap;
  __builtin_va_start (ap, c);
  int val;

  for (i=0; i < cnt; i++) {
      val = __builtin_va_arg (ap, int) ;
      if (val != i + 1) abort();
      sum += val;
  }

  __builtin_va_end (ap);

  return sum;
}

/*
int
f (int cnt, ...)
{
  va_list ap;
  __builtin_va_start (ap, cnt);
  int s = g (cnt, ap);
  __builtin_va_end (ap);
 return s;
}

*/

int
main (void)
{
  int s = g1 (4, 1, 2, 3, 4);
  if (s != 10) abort ();
  s = g4 (11, 99, 99, 99, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
  if (s != 66) abort ();
  s = ga (5, 0, 0, 0, 99, 99, 99, 99, 99, 99, 1, 2, 3, 4, 5);
  if (s != 15) abort ();
  s = g8 (5, 0, 0, 0, 99, 99, 99, 99, 1, 2, 3, 4, 5);
  if (s != 15) abort ();
  exit(0);
  return 0;
}

