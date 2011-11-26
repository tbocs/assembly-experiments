%include "io.mac"

segment .code
  global _start

_start:
  mov  EAX, 46
  PutLInt EAX
  .EXIT
