%include "io.mac"

section .data

section .bss
  vendor_sign resb 13
section .code
  global asm_main

asm_main:
  mov  EAX, 0
  cpuid
  mov  [vendor_sign], EBX
  mov  [vendor_sign + 4], EDX
  mov  [vendor_sign + 8], ECX
  mov  byte [vendor_sign + 12], 0
  PutStr vendor_sign
  nwln
  PutLInt EAX
  nwln
  ret
