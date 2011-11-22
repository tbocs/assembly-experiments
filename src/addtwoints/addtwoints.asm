; src/addtwoints/addtwoints.asm
; Add two integers and output the sum.
; 
; Part of NASM-experiments (https://github.com/tbocs/NASM-experiments)
; Author: Sam Zhai (sam at tbocs dot org)
;
; This file is free software: you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation, either version
; 3 of the License, or (at your option) any later version.
;
; This file is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;
; For more details, please see the GNU General Public License.
; You should have received a copy of the GNU General Public
; License in the root folder of the repository. If not, please
; check out <http://www.gnu.org/licenses/>.

include "io.mac"

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
  mov  EAX, 1
  xor  EBX, EBX
  int  0x80

sum:
  push EBP
  mov  EBP, ESP
  mov  AX, [EBP + 8]
  add  AX, [EBP + 10]
  pop  EBP
  ret  8
