int
g (int a, int b, int (*gi) (int, int))
{
  if ((*gi) (a, b))
    return a;
  else
    return b;
}

  int f2 (int a, int b)
    {
      return a > b;
    }

f ()
{
#ifndef NO_TRAMPOLINES
  int i, j;

  if (g (1, 2, f2) != 2)
    abort ();
#endif
}

main ()
{
  f ();
  exit (0);
}
