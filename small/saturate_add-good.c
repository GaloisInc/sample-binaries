#include <stdint.h>

// Saturate unsigned addition to UINT64_MAX
uint64_t saturate_add(uint64_t a, uint64_t b)
{
  uint64_t c = a + b;
  if(c < a || c < b)
    c = UINT64_MAX;

  return c;
}

void _start()
{
  uint64_t r = saturate_add(5, 6);
  return;
}
