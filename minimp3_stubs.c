#include <caml/alloc.h>
#include <caml/bigarray.h>

#define MINIMP3_IMPLEMENTATION
#include "minimp3.h"

#define Mp3dec_val(v) ((mp3dec_t*)String_val(v))

CAMLprim value ml_minimp3_make(value unit)
{
  (void)unit;
  value decoder = caml_alloc_string(sizeof(mp3dec_t));
  mp3dec_init(Mp3dec_val(decoder));
  return decoder;
}

CAMLprim value
ml_minimp3_decode_frame(value decoder, value input, value offset, value length,
                        value pcm, value vinfo)
{
  mp3dec_frame_info_t info;
  int samples;

  samples = mp3dec_decode_frame(Mp3dec_val(decoder),
      String_val(input) + Long_val(offset), Long_val(length),
      Caml_ba_data_val(pcm), &info);

  Field(vinfo, 0) = Val_long(info.frame_bytes);
  Field(vinfo, 1) = Val_long(info.channels);
  Field(vinfo, 2) = Val_long(info.hz);
  Field(vinfo, 3) = Val_long(info.layer);
  Field(vinfo, 4) = Val_long(info.bitrate_kbps);

  return Val_long(samples);
}

CAMLprim value ml_minimp3_decode_frame_bc(value *argv, int argn)
{
  if (argn != 6) abort();
  return ml_minimp3_decode_frame(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

