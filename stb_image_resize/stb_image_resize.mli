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

val resize_u8 :
  input:u8 t -> output:u8 t ->
  ?alpha_channel:int -> ?flags:flag list ->
  ?edge_mode:edge_mode -> ?filter:filter ->
  ?colorspace:colorspace -> unit -> unit

val resize_u16 :
  input:u16 t -> output:u16 t ->
  ?alpha_channel:int -> ?flags:flag list ->
  ?edge_mode:edge_mode -> ?filter:filter ->
  ?colorspace:colorspace -> unit -> unit

val resize_f32 :
  input:f32 t -> output:f32 t ->
  ?alpha_channel:int -> ?flags:flag list ->
  ?edge_mode:edge_mode -> ?filter:filter ->
  ?colorspace:colorspace -> unit -> unit
