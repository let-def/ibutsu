open Bigarray

(*##############################*)
(** {1 Image representation} *)

(** [buffer] simply is an alias to a bigarray with c_layout.
    The [buffer] type serves two purposes:
    - representing input files,
    - representing the raw pixels of an image.

    Two kind of pixel buffers are manipulated:
    - int8 for images with 8-bit channels
    - float32 for images with floating point channels *)

type 'c buffer = ('a, 'b, c_layout) Array1.t constraint 'c = ('a, 'b) kind

type u8  = (int, int8_unsigned_elt) kind
type u16 = (int, int16_unsigned_elt) kind
type f32 = (float, float32_elt) kind

(** A record describing an image.
    The buffer contains [channels * width * height] items, in this order:
    - channels are interleaved
    - each pixel is made of [channels] items
    - each line is made of [width] pixels
    - image is made of [height] lines *)
type 'kind t = private {
  width : int;
  height : int;
  channels : int;
  offset : int;
  stride : int;
  data : 'kind buffer;
}

(** {2 Creating image} *)

val image : width:int -> height:int -> channels:int ->
            ?offset:int -> ?stride:int ->
            'kind buffer -> ('kind t, [> `Msg of string]) Result.result

val clone : 'a t -> 'a t

(** {2 Image accessors} *)

val width : _ t -> int
val height : _ t -> int
val channels : _ t -> int
val data : 'kind t -> 'kind buffer
val stride : _ t -> int
val offset : _ t -> int
