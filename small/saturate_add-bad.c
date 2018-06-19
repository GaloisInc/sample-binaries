#include <stdint.h>

// This version of saturate_add overflows (i.e., doesn't saturate and is broken)
uint64_t saturate_add(uint64_t a, uint64_t b)
{
  uint64_t c = a + b;

  return c;
}

void _start()
{
  uint64_t r = saturate_add(5, 6);
  return;
}
