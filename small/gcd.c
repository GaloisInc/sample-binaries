unsigned int gcd(unsigned int a, unsigned int b)
{
    unsigned int d = 0;

    while (a & 1 == 0 && b & 1 == 0)
    {
        a = a / 2;
        b = b / 2;
        d = d + 1;
    }
    while (a != b)
    {
        if (a & 1 == 0)
            a = a / 2;
        else {
            if (b & 1 == 0)
                b = b / 2;
            else {
                if (a > b)
                    a = (a - b) / 2;
                else
                    b = (b - a) / 2;
            }
        }
    }
    return a * (2 ^ d);
}

int main(int argc, char **argv)
{
    return gcd(938, 291);
}
