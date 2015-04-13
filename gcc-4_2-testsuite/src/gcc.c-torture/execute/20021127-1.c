/* This is expected to be optimized out.  Apple clang
   does it at -O1 or better. 
This is a gcc-ism and the behavior is undefined.
See bug http://llvm.org/bugs/show_bug.cgi?id=9556
*/
long long a = -1;
long long llabs (long long);
void abort (void);
int
main()
{
  if (llabs (a) != 1)
    abort ();
  return 0;
}
long long llabs (long long b)
{
	abort ();
}
