/* { dg-do compile } */
/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16" }  */
/* { dg-require-effective-target arm_arch_v8m_main_ok } */
/* { dg-add-options arm_arch_v8m_main } */
/* { dg-skip-if "Do not combine float-abi= hard | soft | softfp" {*-*-*} {"-mfloat-abi=soft" -mfloat-abi=hard } {""} } */
/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */

int __attribute__ ((cmse_nonsecure_call)) (*bar) (float, double);

int
foo (int a)
{
  return bar (1.0f, 2.0) + a + 1;
}

/* Checks for saving and clearing prior to function call.  */
/* { dg-final { scan-assembler "lsrs\tr4, r4, #1" } } */
/* { dg-final { scan-assembler "lsls\tr4, r4, #1" } } */
/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
/* { dg-final { scan-assembler "\n\tmov\tr1, r4" } } */
/* { dg-final { scan-assembler-not "\n\tmov\tr2, r4\n\tmov\tr3, r4" } } */

/* Now we check that we use the correct intrinsic to call.  */
/* { dg-final { scan-assembler "bl\t__gnu_cmse_nonsecure_call" } } */

