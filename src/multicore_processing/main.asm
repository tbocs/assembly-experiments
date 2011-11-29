%include "io.mac"

section .data
  output_msg DB "hello world", 0
section .code
  global _start
_start:
  PutStr output_msg
  nwln
  .EXIT
