
#include <stdio.h>
#include <complex>

typedef std::complex<double> complex;

// This version uses a function call to loop, just like the FPa
// versions.
int loop(int max_depth, const complex &c, int i, complex z) {
  if (i == max_depth) return i;
  if (abs(z) >= 2.0)  return i;
  return loop(max_depth, c, i+1, z*z + c);
}

int mandel(int max_depth, const complex &c)
{
  return loop(max_depth, c, 0, 0);
}


int main() {
  complex c(0.1, 0.1);
  printf("%d\n", mandel(5 * 1000 * 1000, c));
  return 0;
}
