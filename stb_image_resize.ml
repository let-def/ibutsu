open Image_type

type edge_mode = [ `CLAMP  | `REFLECT | `WRAP | `ZERO ]

type filter = [
  | `DEFAULT      (* use same filter type that easy-to-use API chooses *)
  | `BOX          (* A trapezoid w/1-pixel wide ramps, same result as box for integer scale ratios *)
  | `TRIANGLE     (* On upsampling, produces same results as bilinear texture filtering *)
  | `CUBICBSPLINE (* The cubic b-spline (aka Mitchell-Netrevalli with B=1,C=0), gaussian-esque *)
  | `CATMULLROM   (* An interpolating cubic spline *)
  | `MITCHELL     (* Mitchell-Netrevalli filter with B=1/3, C=1/3 *)
]

type colorspace = [ `LINEAR | `SRGB ]

type flag = [
  | `ALPHA_PREMULTIPLIED
  | `ALPHA_USES_COLORSPACE
]

external resize_u8 :
  input:u8 t -> output:u8 t ->
  alpha_channel:int -> flags:flag list ->
  edge_mode:edge_mode -> filter:filter -> colorspace:colorspace -> unit
  = "ml_stb_image_resize_u8_bc" "ml_stb_image_resize_u8"

external resize_u16 :
  input:u16 t -> output:u16 t ->
  alpha_channel:int -> flags:flag list ->
  edge_mode:edge_mode -> filter:filter -> colorspace:colorspace -> unit
  = "ml_stb_image_resize_u16_bc" "ml_stb_image_resize_u16"

external resize_f32 :
  input:f32 t -> output:f32 t ->
  alpha_channel:int -> flags:flag list ->
  edge_mode:edge_mode -> filter:filter -> colorspace:colorspace -> unit
  = "ml_stb_image_resize_f32_bc" "ml_stb_image_resize_f32"

let validate input output alpha_channel =
  if Image_type.channels input <> Image_type.channels output then
    invalid_arg "Stb_image_resize: \
                 input and output should have the same number of channels";
  if Image_type.channels input < alpha_channel then
    invalid_arg "Stb_image_resize: invalid alpha channel index"

let resize_u8 ~input ~output
    ?(alpha_channel=(-1)) ?(flags=[])
    ?(edge_mode=`CLAMP) ?(filter=`DEFAULT) ?(colorspace=`LINEAR)
    ()
  =
  validate input output alpha_channel;
  resize_u8
    ~input ~output ~alpha_channel ~flags ~edge_mode ~filter ~colorspace

let resize_u16 ~input ~output
    ?(alpha_channel=(-1)) ?(flags=[])
    ?(edge_mode=`CLAMP) ?(filter=`DEFAULT) ?(colorspace=`LINEAR)
    ()
  =
  validate input output alpha_channel;
  resize_u16
    ~input ~output ~alpha_channel ~flags ~edge_mode ~filter ~colorspace

let resize_f32 ~input ~output
    ?(alpha_channel=(-1)) ?(flags=[])
    ?(edge_mode=`CLAMP) ?(filter=`DEFAULT) ?(colorspace=`LINEAR)
    ()
  =
  validate input output alpha_channel;
  resize_f32
    ~input ~output ~alpha_channel ~flags ~edge_mode ~filter ~colorspace
