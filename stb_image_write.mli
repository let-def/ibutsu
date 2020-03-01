(*
  Stb_image_write for OCaml by Frédéric Bour <frederic.bour(_)lakaban.net>
  To the extent possible under law, the person who associated CC0 with
  Stb_image_write for OCaml has waived all copyright and related or neighboring
  rights to Stb_image_write for OCaml.

  You should have received a copy of the CC0 legalcode along with this
  work. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

  Website: https://github.com/let-def/stb_image_write
  stb_image_write is a public domain library by Sean Barrett,
  http://nothings.org/
  Version 0.2, June 2018
*)
open Image_type

(*####################*)
(** {1 Image writing} *)

val png : string -> u8 t -> (unit, [> `Msg of string]) Result.result
val bmp : string -> u8 t -> (unit, [> `Msg of string]) Result.result
val tga : string -> u8 t -> (unit, [> `Msg of string]) Result.result
val hdr : string -> f32 t -> (unit, [> `Msg of string]) Result.result
val jpg : string -> ?quality:int -> u8 t -> (unit, [> `Msg of string]) Result.result
