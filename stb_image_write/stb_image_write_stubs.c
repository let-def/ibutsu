#include <assert.h>
#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/fail.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/bigarray.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#define STB_IMAGE_WRITE_STATIC
#include "stb_image_write.h"

struct image_info {
  void *ptr;
  int w, h, c;
  int stride;
  int allocated;
};

struct image_info
acquire_image(value image, int item_size, int can_stride)
{
  struct image_info info;

  info.w = Long_val(Field(image, 0));
  info.h = Long_val(Field(image, 1));
  info.c = Long_val(Field(image, 2));

  void *ptr =
    ((char*)(Caml_ba_data_val(Field(image, 5)))) +
    (Long_val(Field(image, 3)) * item_size);

    size_t istride = Long_val(Field(image, 4)) * item_size;
    size_t ostride = (info.w * info.c) * item_size;

  info.allocated = !can_stride && (ostride != istride);

  if (info.allocated)
  {
    info.ptr = malloc((info.w * info.c * info.h) * item_size);
    if (info.ptr == NULL)
      caml_failwith("Stb_image_write: cannot allocate info buffer (incorrect dimension?)");

    for (int y = 0; y < info.h; ++y)
      memcpy(info.ptr + ostride * y, ptr + istride * y, ostride);

    info.stride = ostride;
  }
  else
  {
    info.ptr = ptr;
    info.stride = istride;
  }

  return info;
}

static void
release_image(struct image_info *info)
{
  if (info->allocated)
  {
    free(info->ptr);
    info->allocated = 0;
    info->ptr = NULL;
  }
}

CAMLprim value ml_stbi_write_png(value filename, value image)
{
  CAMLparam2(filename, image);
  int result;

  struct image_info info = acquire_image(image, 1, 1);

  result = stbi_write_png(String_val(filename),
      info.w, info.h, info.c, info.ptr, info.stride);

  release_image(&info);
  CAMLreturn(Val_bool(result));
}

CAMLprim value ml_stbi_write_bmp(value filename, value image)
{
  CAMLparam2(filename, image);
  int result;

  struct image_info info = acquire_image(image, 1, 0);

  result =
    stbi_write_bmp(String_val(filename), info.w, info.h, info.c, info.ptr);

  release_image(&info);
  CAMLreturn(Val_bool(result));
}

CAMLprim value ml_stbi_write_tga(value filename, value image)
{
  CAMLparam2(filename, image);
  int result;

  struct image_info info = acquire_image(image, 1, 0);

  result =
    stbi_write_tga(String_val(filename), info.w, info.h, info.c, info.ptr);

  release_image(&info);
  CAMLreturn(Val_bool(result));
}

CAMLprim value ml_stbi_write_hdr(value filename, value image)
{
  CAMLparam2(filename, image);
  int result;

  struct image_info info = acquire_image(image, 4, 0);

  result =
    stbi_write_tga(String_val(filename), info.w, info.h, info.c, info.ptr);

  release_image(&info);
  CAMLreturn(Val_bool(result));
}

CAMLprim value ml_stbi_write_jpg(value filename, value image, value quality)
{
  CAMLparam3(filename, image, quality);
  int result;

  struct image_info info = acquire_image(image, 1, 0);

  result =
    stbi_write_jpg(String_val(filename), info.w, info.h, info.c, info.ptr, Long_val(quality));

  release_image(&info);
  CAMLreturn(Val_bool(result));
}
