bits 16
org 0x7c00

start:
  cli

  xor  ax, ax
  mov  ds, ax
  
  lgdt [gdt_desc]
  mov  eax, cr0
  or   eax, 1
  mov  cr0, eax

  jmp 08h:clear_pipe

bits 32

clear_pipe:
  mov  ax, 0x10
  mov  ds, ax
  mov  ss, ax
  mov  esp, 0x90000

  mov  ecx, 14
  xor  eax, eax
  mov  ebx, 0xb8000
printout_msg:
  mov dl, [prompt_msg + eax]
  mov [ds:ebx], dl
  mov dl, cl
  shr dl, 4
  add dl, al
  mov byte [ds:ebx + 1], dl
  inc eax
  add ebx, 2
  loop printout_msg
  
looping:
  jmp looping

prompt_msg:
  db "Segfault Huang", 0

align 4

gdt:
gdt_null:
  dd 0
  dd 0
gdt_code:
  dw 0xffff
  dw 0
  db 0
  db 10011010b
  db 11001111b
  db 0
gdt_data:
  dw 0xffff
  dw 0
  db 0
  db 10010010b
  db 11001111b
  db 0
gdt_end:
gdt_desc:
  dw gdt_end - gdt - 1
  dd gdt

times 510-($-$$) db 0
dw 0xaa55

