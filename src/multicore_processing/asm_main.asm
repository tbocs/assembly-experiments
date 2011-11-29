%include "io.mac"

section .data
  output_msg DB "hello world", 0
section .code
  global main

main:
  PutStr output_msg
  nwln
  ret
