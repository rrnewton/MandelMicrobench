#include <stdio.h>
#include <complex>

typedef std::complex<double> complex;

// For each point, is z = z*z + c bounded?
int mandel(int max_depth, const complex &c)
{
    int count = 0;
    complex z = 0;

    for(int i = 0; i < max_depth; i++)
    {
        if (abs(z) >= 2.0) break;
        z = z*z + c;
        count++;
    }
    return count;
}

int main() {
  complex c(0.1, 0.1);
  printf("%d\n", mandel(5 * 1000 * 1000, c));
  return 0;
}
