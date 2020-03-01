#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/bigarray.h>

#define STB_IMAGE_RESIZE_IMPLEMENTATION
#define STB_IMAGE_RESIZE_STATIC
#include "stb_image_resize.h"

#define TAG_CLAMP -968447269
#define TAG_REFLECT -386050019
#define TAG_WRAP 968884682
#define TAG_ZERO 1001510696

static stbir_filter Edge_val(value edge)
{
  switch (Long_val(edge))
  {
    case TAG_CLAMP:   return STBIR_EDGE_CLAMP;
    case TAG_REFLECT: return STBIR_EDGE_REFLECT;
    case TAG_WRAP:    return STBIR_EDGE_WRAP;
    case TAG_ZERO:    return STBIR_EDGE_ZERO;
    default: abort();
  }
}
#define TAG_DEFAULT 462924961
#define TAG_BOX 3299819
#define TAG_TRIANGLE -414495032
#define TAG_CUBICBSPLINE -606413591
#define TAG_CATMULLROM 445622738
#define TAG_MITCHELL -378906616

static stbir_filter Filter_val(value filter)
{
  switch (Long_val(filter))
  {
    case TAG_DEFAULT:      return STBIR_FILTER_DEFAULT;
    case TAG_BOX:          return STBIR_FILTER_BOX;
    case TAG_TRIANGLE:     return STBIR_FILTER_TRIANGLE;
    case TAG_CUBICBSPLINE: return STBIR_FILTER_CUBICBSPLINE;
    case TAG_CATMULLROM:   return STBIR_FILTER_CATMULLROM;
    case TAG_MITCHELL:     return STBIR_FILTER_MITCHELL;
    default: abort();
  }
}

#define TAG_LINEAR 522386917
#define TAG_SRGB 924527738

static stbir_colorspace Colorspace_val(value colorspace)
{
  switch (Long_val(colorspace))
  {
    case TAG_LINEAR: return STBIR_COLORSPACE_LINEAR;
    case TAG_SRGB: return STBIR_COLORSPACE_SRGB;
    default: abort();
  }
}

#define TAG_ALPHA_PREMULTIPLIED -864200395
#define TAG_ALPHA_USES_COLORSPACE -129506155

static int Flags_val(value filter)
{
  int result = 0;
  while (filter != Val_unit)
  {
    switch (Long_val(Field(filter, 0)))
    {
      case TAG_ALPHA_PREMULTIPLIED:
        result |= STBIR_FLAG_ALPHA_PREMULTIPLIED;
        break;
      case TAG_ALPHA_USES_COLORSPACE:
        result |= STBIR_FLAG_ALPHA_USES_COLORSPACE;
        break;
      default:
        abort();
    }
    filter = Field(filter, 1);
  }
  return result;
}

struct image_info
{
  int w, h, c;
  void *ptr;
  int stride;
};

static struct image_info open_image(value image, int item_size)
{
  struct image_info info;
  info.w = Long_val(Field(image, 0));
  info.h = Long_val(Field(image, 1));
  info.c = Long_val(Field(image, 2));
  info.ptr =
    ((char*)Caml_ba_data_val(Field(image, 5))) +
    (Long_val(Field(image, 3)) * item_size);
  info.stride = Long_val(Field(image, 4)) * item_size;
  return info;
}

CAMLprim value
ml_stb_image_resize_u8(value input, value output,
                       value alpha_channel, value flags,
                       value edge_mode, value filter, value colorspace)
{
  CAMLparam3(input, output, flags);

  struct image_info iinfo, oinfo;

  iinfo = open_image(input, 1);
  oinfo = open_image(output, 1);

  if (iinfo.c != oinfo.c) abort();

  int result;
  result =
    stbir_resize_uint8_generic(
        iinfo.ptr, iinfo.w, iinfo.h, iinfo.stride,
        oinfo.ptr, oinfo.w, oinfo.h, oinfo.stride,
        iinfo.c, Long_val(alpha_channel),
        Flags_val(flags),
        Edge_val(edge_mode),
        Filter_val(filter),
        Colorspace_val(colorspace),
        NULL);

  CAMLreturn(Val_bool(result));
}

CAMLprim value
ml_stb_image_resize_u16(value input, value output,
                        value alpha_channel, value flags,
                        value edge_mode, value filter, value colorspace)
{
  CAMLparam3(input, output, flags);

  struct image_info iinfo, oinfo;

  iinfo = open_image(input, 2);
  oinfo = open_image(output, 2);

  if (iinfo.c != oinfo.c) abort();

  int result;
  result =
    stbir_resize_uint16_generic(
        iinfo.ptr, iinfo.w, iinfo.h, iinfo.stride,
        oinfo.ptr, oinfo.w, oinfo.h, oinfo.stride,
        iinfo.c, Long_val(alpha_channel),
        Flags_val(flags),
        Edge_val(edge_mode),
        Filter_val(filter),
        Colorspace_val(colorspace),
        NULL);

  CAMLreturn(Val_bool(result));
}

CAMLprim value
ml_stb_image_resize_f32(value input, value output,
                        value alpha_channel, value flags,
                        value edge_mode, value filter, value colorspace)
{
  CAMLparam3(input, output, flags);

  struct image_info iinfo, oinfo;

  iinfo = open_image(input, 4);
  oinfo = open_image(output, 4);

  if (iinfo.c != oinfo.c) abort();

  int result;
  result =
    stbir_resize_float_generic(
        iinfo.ptr, iinfo.w, iinfo.h, iinfo.stride,
        oinfo.ptr, oinfo.w, oinfo.h, oinfo.stride,
        iinfo.c, Long_val(alpha_channel),
        Flags_val(flags),
        Edge_val(edge_mode),
        Filter_val(filter),
        Colorspace_val(colorspace),
        NULL);

  CAMLreturn(Val_bool(result));
}

CAMLprim value
ml_stb_image_resize_u8_bc(value *argv, int argn)
{
  if (argn != 7) abort();
  return ml_stb_image_resize_u8
    (argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLprim value
ml_stb_image_resize_u16_bc(value *argv, int argn)
{
  if (argn != 7) abort();
  return ml_stb_image_resize_u16
    (argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLprim value
ml_stb_image_resize_f32_bc(value *argv, int argn)
{
  if (argn != 7) abort();
  return ml_stb_image_resize_f32
    (argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}
