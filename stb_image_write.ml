open Image_type

external png : string -> u8 t -> bool = "ml_stbi_write_png"
external bmp : string -> u8 t -> bool = "ml_stbi_write_bmp"
external tga : string -> u8 t -> bool = "ml_stbi_write_tga"
external hdr : string -> f32 t -> bool = "ml_stbi_write_hdr"
external jpg : string -> u8 t -> quality:int -> bool = "ml_stbi_write_jpg"

let png fname image =
  match png fname image with
  | true -> Result.Ok ()
  | false -> Result.Error (`Msg "Stb_image_write.png: Cannot save image")
  | exception (Failure message) -> Result.Error (`Msg message)

let bmp fname image =
  match bmp fname image with
  | true -> Result.Ok ()
  | false -> Result.Error (`Msg "Stb_image_write.bmp: Cannot save image")
  | exception (Failure message) -> Result.Error (`Msg message)

let tga fname image =
  match tga fname image with
  | true -> Result.Ok ()
  | false -> Result.Error (`Msg "Stb_image_write.tga: Cannot save image")
  | exception (Failure message) -> Result.Error (`Msg message)

let hdr fname image =
  match hdr fname image with
  | true -> Result.Ok ()
  | false -> Result.Error (`Msg "Stb_image_write.hdr: Cannot save image")
  | exception (Failure message) -> Result.Error (`Msg message)

let jpg fname ?(quality=90) image =
  match jpg fname image ~quality with
  | true -> Result.Ok ()
  | false -> Result.Error (`Msg "Stb_image_write.jpg: Cannot save image")
  | exception (Failure message) -> Result.Error (`Msg message)
