open Bigarray

type 'kind buffer = ('a, 'b, c_layout) Array1.t
  constraint 'kind = ('a, 'b) kind

type 'kind t = {
  width: int;
  height: int;
  channels: int;
  offset: int;
  stride: int;
  data: 'kind buffer;
}

type f32 = (float, float32_elt) kind
type u8 = (int, int8_unsigned_elt) kind
type u16 = (int, int16_unsigned_elt) kind

let image ~width ~height ~channels ?(offset=0) ?(stride=width*channels) data =
  let size = Array1.dim data in
  if width < 0 then
    Result.Error (`Msg "width should be positive")
  else if height < 0 then
    Result.Error (`Msg "height should be positive")
  else if channels <= 0 then
    Result.Error (`Msg "channels should be positive")
  else if offset < 0 then
    Result.Error (`Msg "offset should be positive")
  else if offset + stride * height > size then
    Result.Error (`Msg "image does not fit in buffer")
  else if stride < width * channels then
    Result.Error (`Msg "stride is too small (minimum size is width * channels)")
  else
    Result.Ok { width; height; channels; offset; stride; data }

let clone buf =
  let open Bigarray in
  let buf' = Array1.create (Array1.kind buf) c_layout (Array1.dim buf) in
  Array1.blit buf buf';
  buf'

let clone t = {t with data = clone t.data}

let width t = t.width
let height t = t.height
let channels t = t.channels
let data t = t.data
let stride t = t.stride
let offset t = t.offset
