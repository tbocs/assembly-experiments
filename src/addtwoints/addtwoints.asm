%include "io.mac"

segment data
  prompt_msg1 DB "Please input the first number: ", 0
  prompt_msg2 DB "Please input the second number: ", 0
  sum_msg     DB "The sum is: ", 0

segment code
  global _start

_start:
  PutStr prompt_msg1
  GetInt CX
  PutStr prompt_msg2
  GetInt DX

  push CX
  push DX
  call sum
  PutStr sum_msg
  PutInt AX
  nwln

exit:
  mov EAX, 1
  xor EBX, EBX
  int 0x80

sum:
  push EBP
  mov EBP, ESP
  mov AX, [EBP + 8]
  add AX, [EBP + 10]
  pop EBP
  ret 8
