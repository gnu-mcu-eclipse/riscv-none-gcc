/* Callee-saved register spill and fill routines for RISC-V.

   Copyright (C) 2016-2017 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation; either version 3, or (at your option) any later
version.

GCC is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

  .text

  .globl __riscv_save_12
  .globl __riscv_save_11
  .globl __riscv_save_10
  .globl __riscv_save_9
  .globl __riscv_save_8
  .globl __riscv_save_7
  .globl __riscv_save_6
  .globl __riscv_save_5
  .globl __riscv_save_4
  .globl __riscv_save_3
  .globl __riscv_save_2
  .globl __riscv_save_1
  .globl __riscv_save_0

  .globl __riscv_restore_12
  .globl __riscv_restore_11
  .globl __riscv_restore_10
  .globl __riscv_restore_9
  .globl __riscv_restore_8
  .globl __riscv_restore_7
  .globl __riscv_restore_6
  .globl __riscv_restore_5
  .globl __riscv_restore_4
  .globl __riscv_restore_3
  .globl __riscv_restore_2
  .globl __riscv_restore_1
  .globl __riscv_restore_0

#if __riscv_xlen == 64

__riscv_save_12:
  .cfi_startproc
  # __riscv_save_* routine use t0/x5 as return address
  .cfi_return_column 5
  addi sp, sp, -112
  .cfi_def_cfa_offset 112
  li t1, 0
  sd s11, 8(sp)
  .cfi_offset 27, -104
  j .Ls10

__riscv_save_11:
__riscv_save_10:
  .cfi_restore 27
  addi sp, sp, -112
  .cfi_def_cfa_offset 112
  li t1, -16
.Ls10:
  sd s10, 16(sp)
  .cfi_offset 26, -96
  sd s9, 24(sp)
  .cfi_offset 25, -88
  j .Ls8

__riscv_save_9:
__riscv_save_8:
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  addi sp, sp, -112
  .cfi_def_cfa_offset 112
  li t1, -32
.Ls8:
  sd s8, 32(sp)
  .cfi_offset 24, -80
  sd s7, 40(sp)
  .cfi_offset 23, -72
  j .Ls6

__riscv_save_7:
__riscv_save_6:
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  addi sp, sp, -112
  .cfi_def_cfa_offset 112
  li t1, -48
.Ls6:
  sd s6, 48(sp)
  .cfi_offset 22, -64
  sd s5, 56(sp)
  .cfi_offset 21, -56
  j .Ls4

__riscv_save_5:
__riscv_save_4:
  .cfi_restore 21
  .cfi_restore 22
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  addi sp, sp, -112
  .cfi_def_cfa_offset 112
  li t1, -64
.Ls4:
  sd s4, 64(sp)
  .cfi_offset 20, -48
  sd s3, 72(sp)
  .cfi_offset 19, -40
  j .Ls2

__riscv_save_3:
__riscv_save_2:
  .cfi_restore 19
  .cfi_restore 20
  .cfi_restore 21
  .cfi_restore 22
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  addi sp, sp, -112
  .cfi_def_cfa_offset 112
  li t1, -80
.Ls2:
  sd s2, 80(sp)
  .cfi_offset 18, -32
  sd s1, 88(sp)
  .cfi_offset 9, -24
  sd s0, 96(sp)
  .cfi_offset 8, -16
  sd ra, 104(sp)
  .cfi_offset 1, -8
  # CFA info is not correct in next 2 instruction since t1's
  # value is depend on how may register really save.
  sub sp, sp, t1
  jr t0
  .cfi_endproc

__riscv_save_1:
__riscv_save_0:
  .cfi_startproc
  # __riscv_save_* routine use t0/x5 as return address
  .cfi_return_column 5
  addi sp, sp, -16
  .cfi_def_cfa_offset 16
  sd s0, 0(sp)
  .cfi_offset 8, -16
  sd ra, 8(sp)
  .cfi_offset 1, -8
  jr t0
  .cfi_endproc

__riscv_restore_12:
  .cfi_startproc
  .cfi_def_cfa_offset 112
  .cfi_offset 27, -104
  .cfi_offset 26, -96
  .cfi_offset 25, -88
  .cfi_offset 24, -80
  .cfi_offset 23, -72
  .cfi_offset 22, -64
  .cfi_offset 21, -56
  .cfi_offset 20, -48
  .cfi_offset 19, -40
  .cfi_offset 18, -32
  .cfi_offset 9, -24
  .cfi_offset 8, -16
  .cfi_offset 1, -8
  ld s11, 8(sp)
  .cfi_restore 27
  addi sp, sp, 16

__riscv_restore_11:
__riscv_restore_10:
  .cfi_restore 27
  .cfi_def_cfa_offset 96
  ld s10, 0(sp)
  .cfi_restore 26
  ld s9, 8(sp)
  .cfi_restore 25
  addi sp, sp, 16

__riscv_restore_9:
__riscv_restore_8:
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 80
  ld s8, 0(sp)
  .cfi_restore 24
  ld s7, 8(sp)
  .cfi_restore 23
  addi sp, sp, 16

__riscv_restore_7:
__riscv_restore_6:
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 64
  ld s6, 0(sp)
  .cfi_restore 22
  ld s5, 8(sp)
  .cfi_restore 21
  addi sp, sp, 16

__riscv_restore_5:
__riscv_restore_4:
  .cfi_restore 21
  .cfi_restore 22
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 48
  ld s4, 0(sp)
  .cfi_restore 20
  ld s3, 8(sp)
  .cfi_restore 19
  addi sp, sp, 16

__riscv_restore_3:
__riscv_restore_2:
  .cfi_restore 19
  .cfi_restore 20
  .cfi_restore 21
  .cfi_restore 22
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 32
  ld s2, 0(sp)
  .cfi_restore 18
  ld s1, 8(sp)
  .cfi_restore 9
  addi sp, sp, 16

__riscv_restore_1:
__riscv_restore_0:
  .cfi_restore 9
  .cfi_restore 18
  .cfi_restore 19
  .cfi_restore 20
  .cfi_restore 21
  .cfi_restore 22
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 16
  ld s0, 0(sp)
  .cfi_restore 8
  ld ra, 8(sp)
  .cfi_restore 1
  addi sp, sp, 16
  .cfi_def_cfa_offset 0
  ret
  .cfi_endproc

#else

#ifdef __riscv_32e
__riscv_save_2:
__riscv_save_1:
__riscv_save_0:
  .cfi_startproc
  # __riscv_save_* routine use t0/x5 as return address
  .cfi_return_column 5
  addi sp, sp, -12
  .cfi_def_cfa_offset 12
  sw s1, 0(sp)
  .cfi_offset 9, -12
  sw s0, 4(sp)
  .cfi_offset 8, -8
  sw ra, 8(sp)
  .cfi_offset 1, 0
  jr t0
  .cfi_endproc

__riscv_restore_2:
__riscv_restore_1:
__riscv_restore_0:
  .cfi_startproc
  .cfi_def_cfa_offset 14
  lw s1, 0(sp)
  .cfi_restore 9
  lw s0, 4(sp)
  .cfi_restore 8
  lw ra, 8(sp)
  .cfi_restore 1
  addi sp, sp, 12
  .cfi_def_cfa_offset 0
  ret
  .cfi_endproc
#else
__riscv_save_12:
  .cfi_startproc
  # __riscv_save_* routine use t0/x5 as return address
  .cfi_return_column 5
  addi sp, sp, -64
  .cfi_def_cfa_offset 64
  li t1, 0
  sw s11, 12(sp)
  .cfi_offset 27, -52
  j .Ls10

__riscv_save_11:
__riscv_save_10:
__riscv_save_9:
__riscv_save_8:
  .cfi_restore 27
  addi sp, sp, -64
  .cfi_def_cfa_offset 64
  li t1, -16
.Ls10:
  sw s10, 16(sp)
  .cfi_offset 26, -48
  sw s9, 20(sp)
  .cfi_offset 25, -44
  sw s8, 24(sp)
  .cfi_offset 24, -40
  sw s7, 28(sp)
  .cfi_offset 23, -36
  j .Ls6

__riscv_save_7:
__riscv_save_6:
__riscv_save_5:
__riscv_save_4:
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  addi sp, sp, -64
  .cfi_def_cfa_offset 64
  li t1, -32
.Ls6:
  sw s6, 32(sp)
  .cfi_offset 22, -32
  sw s5, 36(sp)
  .cfi_offset 21, -28
  sw s4, 40(sp)
  .cfi_offset 20, -24
  sw s3, 44(sp)
  .cfi_offset 19, -20
  sw s2, 48(sp)
  .cfi_offset 18, -16
  sw s1, 52(sp)
  .cfi_offset 9, -12
  sw s0, 56(sp)
  .cfi_offset 8, -8
  sw ra, 60(sp)
  .cfi_offset 1, -4
  # CFA info is not correct in next 2 instruction since t1's
  # value is depend on how may register really save.
  sub sp, sp, t1
  jr t0
  .cfi_endproc

__riscv_save_3:
__riscv_save_2:
__riscv_save_1:
__riscv_save_0:
  .cfi_startproc
  # __riscv_save_* routine use t0/x5 as return address
  .cfi_return_column 5
  addi sp, sp, -16
  .cfi_def_cfa_offset 16
  sw s2, 0(sp)
  sw s1, 4(sp)
  .cfi_offset 9, -16
  sw s0, 8(sp)
  .cfi_offset 8, -8
  sw ra, 12(sp)
  .cfi_offset 1, -4
  jr t0
  .cfi_endproc

__riscv_restore_12:
  .cfi_startproc
  .cfi_def_cfa_offset 64
  .cfi_offset 27, -52
  .cfi_offset 26, -48
  .cfi_offset 25, -44
  .cfi_offset 24, -40
  .cfi_offset 23, -36
  .cfi_offset 22, -32
  .cfi_offset 21, -28
  .cfi_offset 20, -24
  .cfi_offset 19, -20
  .cfi_offset 18, -16
  .cfi_offset 9, -12
  .cfi_offset 8, -8
  .cfi_offset 1, -4
  lw s11, 12(sp)
  .cfi_restore 27
  addi sp, sp, 16

__riscv_restore_11:
__riscv_restore_10:
__riscv_restore_9:
__riscv_restore_8:
  .cfi_restore 27
  .cfi_def_cfa_offset 48
  lw s10, 0(sp)
  .cfi_restore 26
  lw s9, 4(sp)
  .cfi_restore 25
  lw s8, 8(sp)
  .cfi_restore 24
  lw s7, 12(sp)
  .cfi_restore 23
  addi sp, sp, 16

__riscv_restore_7:
__riscv_restore_6:
__riscv_restore_5:
__riscv_restore_4:
  .cfi_restore 23
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 32
  lw s6, 0(sp)
  .cfi_restore 22
  lw s5, 4(sp)
  .cfi_restore 21
  lw s4, 8(sp)
  .cfi_restore 20
  lw s3, 12(sp)
  .cfi_restore 19
  addi sp, sp, 16

__riscv_restore_3:
__riscv_restore_2:
__riscv_restore_1:
__riscv_restore_0:
  .cfi_restore 19
  .cfi_restore 20
  .cfi_restore 21
  .cfi_restore 22
  .cfi_restore 24
  .cfi_restore 25
  .cfi_restore 26
  .cfi_restore 27
  .cfi_def_cfa_offset 16
  lw s2, 0(sp)
  .cfi_restore 18
  lw s1, 4(sp)
  .cfi_restore 9
  lw s0, 8(sp)
  .cfi_restore 8
  lw ra, 12(sp)
  .cfi_restore 1
  addi sp, sp, 16
  .cfi_def_cfa_offset 0
  ret
  .cfi_endproc
#endif /* __riscv_32e */

#endif /* __riscv_xlen == 64 */
