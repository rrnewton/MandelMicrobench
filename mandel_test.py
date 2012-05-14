
def mandel(depth, c):
    count = 0
    z = complex(0,0)
    while (True):
        if (count == depth): break
        if (abs(z) >= 2.0):  break
        z = z*z + c;        
        count += 1
    return count

print(mandel(5 * 1000 * 1000, complex(0.1,0.1)));
