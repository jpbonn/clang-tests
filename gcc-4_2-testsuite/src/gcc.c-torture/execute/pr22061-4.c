  void foo (int a[2][N++]) {}
void
bar (int N)
{
  int a[2][N];
  foo (a);
  int b[2][N];
  foo (b);
  if (sizeof (a) != sizeof (int) * 2 * 1)
    abort ();
  if (sizeof (b) != sizeof (int) * 2 * 2)
    abort ();
  if (N != 3)
    abort ();
}

int
main (void)
{
  bar (1);
  exit (0);
}
