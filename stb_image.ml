open Image_type

type 'a result = ('a, [`Msg of string]) Result.result

type int8 = u8
type float32 = f32

external load_unmanaged    : ?channels:int -> string   -> u8 t result  = "ml_stbi_load"
external loadf_unmanaged   : ?channels:int -> string   -> f32 t result = "ml_stbi_loadf"
external decode_unmanaged  : ?channels:int -> _ buffer -> u8 t result  = "ml_stbi_load_mem"
external decodef_unmanaged : ?channels:int -> _ buffer -> f32 t result = "ml_stbi_loadf_mem"

external ml_stbi_image_free : _ buffer -> unit = "ml_stbi_image_free"
let free_unmanaged image =
  ml_stbi_image_free image.data

let manage f ?channels filename =
  match f ?channels filename with
  | Result.Error _ as err -> err
  | Result.Ok image ->
    (*let managed = clone image in
    free_unmanaged image;*)
    Result.Ok image

let load    ?channels filename = manage load_unmanaged ?channels filename
let loadf   ?channels filename = manage loadf_unmanaged ?channels filename
let decode  ?channels filename = manage decode_unmanaged ?channels filename
let decodef ?channels filename = manage decodef_unmanaged ?channels filename

let validate_mipmap t1 t2 =
  if t1.channels <> t2.channels then
    invalid_arg "mipmap: images have different number of channels";
  if t1.width / 2 <> t2.width || t1.height / 2 <> t2.height then
    invalid_arg "mipmap: second image size should exactly be half of first image"

external copy : int8 t -> int8 t -> unit = "ml_stbi_copy"
external copyf : float32 t -> float32 t -> unit = "ml_stbi_copyf"

external mipmap : int8 t -> int8 t -> unit = "ml_stbi_mipmap"
external mipmapf : float32 t -> float32 t -> unit = "ml_stbi_mipmapf"

let mipmap t1 t2 = validate_mipmap t1 t2; mipmap t1 t2
let mipmapf t1 t2 = validate_mipmap t1 t2; mipmapf t1 t2

external vflip : int8 t -> unit = "ml_stbi_vflip"
external vflipf : float32 t -> unit = "ml_stbi_vflipf"

(** Blur the image *)
external expblur : int8 t -> radius:float -> unit = "ml_stbi_expblur"
