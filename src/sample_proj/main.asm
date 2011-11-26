; src/sample_proj/main.asm
; A sample assembly source file.
; 
; Part of assembly-experiments (https://github.com/tbocs/assembly-experiments)
; Author: Sam Zhai (sam at tbocs dot org)
;
; This file is free software: you can redistribute the including programs and
; source files created by the author and/or modify them under the terms of the
; GNU General Public License as published by the Free Software Foundation,
; either version 3 of the License, or (at your option) any later version.
;
; This package is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
; FOR A PARTICULAR PURPOSE. Some files created by third-parties are included as
; external code libraries auxiliary resources; other licenses may apply.
;
; For more details, please see the GNU General Public License. You should have
; received a copy of the GNU General Public License at the root of this package.
; If not, please check out <http://www.gnu.org/licenses/>. 

include "io.mac"

segment data
  prompt_str DB "Hello World by Assembly!", 0

segment code
  global _start
  extern printout_c, printout_cpp

_start:
  PutStr prompt_str
  nwln
  call printout_c
  call printout_cpp
  .EXIT
