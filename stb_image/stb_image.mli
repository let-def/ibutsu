(*
  Stb_image for OCaml by Frédéric Bour <frederic.bour(_)lakaban.net>
  To the extent possible under law, the person who associated CC0 with
  Stb_image for OCaml has waived all copyright and related or neighboring
  rights to Stb_image for OCaml.

  You should have received a copy of the CC0 legalcode along with this
  work. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

  Website: https://github.com/let-def/stb_image
  stb_image is a public domain library by Sean Barrett,
  http://nothings.org/
  Version 0.1, September 2015
*)
open Image_type

type 'a result = ('a, [`Msg of string]) Result.result

(** Load an 8-bit per channel image from a filename.
    If [channels] is specified, it has to be between 1 and 4 and the decoded
    image will be processed to have the requested number of channels. *)
val load    : ?channels:int -> string -> u8 t result

(** Load a floating point channel image from a filename.
    See [load] for [channels] parameter. *)
val loadf   : ?channels:int -> string -> f32 t result

(** Decode an 8-bit per channel image from a buffer.
    See [load] for [channels] parameter. *)
val decode  : ?channels:int -> _ buffer -> u8 t result

(** Decode a floating point channel image from a buffer.
    See [load] for [channels] parameter. *)
val decodef : ?channels:int -> _ buffer -> f32 t result

(** {2 Low-level interface}

    Functions are similar to the above one, except memory is not managed by OCaml GC.
    It has to be released explicitly with [free_unmanaged] function.

    You get slightly faster load times, more deterministic memory use and more
    responsibility.
    Use at your own risk! *)

val load_unmanaged    : ?channels:int -> string   -> u8 t result
val loadf_unmanaged   : ?channels:int -> string   -> f32 t result
val decode_unmanaged  : ?channels:int -> _ buffer -> u8 t result
val decodef_unmanaged : ?channels:int -> _ buffer -> f32 t result
val free_unmanaged: _ t -> unit

(** {2 Image filtering} *)

(** Generate one level of mipmap: downsample image half in each dimension.
    In [mipmap imgin imgout]:
    - imgout.channels must be imgin.channels
    - imgout.width must be imgin.width / 2
    - imgout.height must be imgin.height / 2
    - imgout.data will be filled with downsampled imgin.data
*)
val mipmap : u8 t -> u8 t -> unit

(** Downsample floating point images.  See [mipmap].  *)
val mipmapf : f32 t -> f32 t -> unit

(** Flip the image vertically *)
val vflip : u8 t -> unit

(** Flip the image vertically *)
val vflipf : f32 t -> unit

(** Copy the image without any change.
    Both images must have the exact same size. *)
val copy : u8 t -> u8 t -> unit

(** Copy the image without any change.
    Both images must have the exact same size. *)
val copyf : f32 t -> f32 t -> unit

(** Blur the image *)
val expblur : u8 t -> radius:float -> unit
