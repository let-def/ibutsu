#include <caml/mlvalues.h>
#include <caml/alloc.h>

#define STB_PERLIN_IMPLEMENTATION
#include "stb_perlin.h"

CAMLprim double
ml_stb_perlin_noise3(double x, double y, double z,
                     intnat x_wrap, intnat y_wrap, intnat z_wrap)
{
  return stb_perlin_noise3(x, y, z, x_wrap, y_wrap, z_wrap);
}

CAMLprim double
ml_stb_perlin_ridge_noise3(double x, double y, double z,
                           double lacunarity, double gain, double offset,
                           intnat octaves)

{
  return stb_perlin_ridge_noise3(x, y, z, lacunarity, gain, offset, octaves);

}

CAMLprim double
ml_stb_perlin_fbm_noise3(double x, double y, double z,
                         double lacunarity, double gain,
                         intnat octaves)
{
  return stb_perlin_fbm_noise3(x, y, z, lacunarity, gain, octaves);
}

CAMLprim double
ml_stb_perlin_turbulence_noise3(double x, double y, double z,
                                double lacunarity, double gain,
                                intnat octaves)
{
  return stb_perlin_turbulence_noise3(x, y, z, lacunarity, gain, octaves);
}

CAMLprim value ml_stb_perlin_noise3_bc(value *argv, int argn)
{
  if (argn != 6) abort();
  return caml_copy_double(ml_stb_perlin_noise3(
        Double_val(argv[0]),
        Double_val(argv[1]),
        Double_val(argv[2]),
        Long_val(argv[3]),
        Long_val(argv[4]),
        Long_val(argv[5])
      ));
}


CAMLprim value ml_stb_perlin_ridge_noise3_bc(value *argv, int argn)
{
  if (argn != 7) abort();
  return caml_copy_double(ml_stb_perlin_ridge_noise3(
        Double_val(argv[0]),
        Double_val(argv[1]),
        Double_val(argv[2]),
        Double_val(argv[3]),
        Double_val(argv[4]),
        Double_val(argv[5]),
        Long_val(argv[6])
      ));
}



CAMLprim value ml_stb_perlin_fbm_noise3_bc(value *argv, int argn)
{
  if (argn != 6) abort();
  return caml_copy_double(ml_stb_perlin_fbm_noise3(
        Double_val(argv[0]),
        Double_val(argv[1]),
        Double_val(argv[2]),
        Double_val(argv[3]),
        Double_val(argv[4]),
        Long_val(argv[5])
      ));
}


CAMLprim value ml_stb_perlin_turbulence_noise3_bc(value *argv, int argn)
{
  if (argn != 6) abort();
  return caml_copy_double(ml_stb_perlin_turbulence_noise3(
        Double_val(argv[0]),
        Double_val(argv[1]),
        Double_val(argv[2]),
        Double_val(argv[3]),
        Double_val(argv[4]),
        Long_val(argv[5])
      ));
}
