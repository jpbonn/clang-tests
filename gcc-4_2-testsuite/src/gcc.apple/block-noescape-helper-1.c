/* APPLE LOCAL file radar 6083129 byref escapes */
/* Test for generation of escape _Block_object_dispose call when a local
   __block variable is copied in. */
/* { dg-do run { target *-*-darwin[1-2][0-9]* } } */
/* { dg-options "-fblocks" } */
/* { dg-skip-if "" { powerpc*-*-darwin* } { "-m64" } { "" } } */

#include <stdio.h>

void *_NSConcreteStackBlock;
void _Block_object_assign(void * dst, const void *src, int flag){}

extern void abort(void);

static int count;
static void _Block_object_dispose(void * arg, int flag) {
  ++count;
}

void junk(void (^block)(void)) {
  block();
}

int test() {
  {
    int __block i = 10;
    void (^dummy)(void) = ^{ printf("i = %d\n", i); };
    junk(dummy);
  }
  return count;
}

int main() {
  if ( test() != 1)
    abort();
  return 0;
}
