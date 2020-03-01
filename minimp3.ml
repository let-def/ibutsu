type t

type frame_info = {
  mutable frame_bytes: int;
  mutable channels: int;
  mutable hz: int;
  mutable layer: int;
  mutable bitrate_kbps: int;
}

let empty_frame () =
  { frame_bytes = 0; channels = 0; hz = 0; layer = 0; bitrate_kbps = 0 }

type samples =
  (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array1.t

let buffer_size = 1152 * 2

external make : unit -> t = "ml_minimp3_make"

external decode_string
  : t -> string -> offset:int -> length:int -> samples -> frame_info -> int
  = "ml_minimp3_decode_frame_bc" "ml_minimp3_decode_frame"

external decode_bytes
  : t -> bytes -> offset:int -> length:int -> samples -> frame_info -> int
  = "ml_minimp3_decode_frame_bc" "ml_minimp3_decode_frame"

let validate t length' ~offset ~length pcm =
  if offset < 0 || offset > length' || length' - offset < length then
    invalid_arg "Minimp3.decode: input out of bounds";
  if Bigarray.Array1.dim pcm < buffer_size then
    invalid_arg "Minimp3.decode: sample buffer too small \
                 (minimum is Minimp3.buffer_size)"

let decode_string t string ~offset ~length pcm info =
  validate t (String.length string) ~offset ~length pcm;
  decode_string t string ~offset ~length pcm info

let decode_bytes t bytes ~offset ~length pcm info =
  validate t (Bytes.length bytes) ~offset ~length pcm;
  decode_bytes t bytes ~offset ~length pcm info
