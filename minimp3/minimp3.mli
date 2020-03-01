type t

type frame_info = {
  mutable frame_bytes: int;
  mutable channels: int;
  mutable hz: int;
  mutable layer: int;
  mutable bitrate_kbps: int;
}

val empty_frame : unit -> frame_info

type samples =
  (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array1.t

val buffer_size : int

val make : unit -> t

val decode_bytes :
  t -> bytes -> offset:int -> length:int -> samples -> frame_info -> int

val decode_string :
  t -> string -> offset:int -> length:int -> samples -> frame_info -> int
