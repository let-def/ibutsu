let string_of_edge = function
  | `CLAMP -> "clamp"
  | `REFLECT -> "reflect"
  | `WRAP -> "wrap"
  | `ZERO -> "zero"

let string_of_filter = function
  | `DEFAULT      -> "default"
  | `BOX          -> "box"
  | `TRIANGLE     -> "triangle"
  | `CUBICBSPLINE -> "cubicbspline"
  | `CATMULLROM   -> "catmullrom"
  | `MITCHELL     -> "mitchell"

let string_of_colorspace = function
  | `LINEAR -> "linear"
  | `SRGB   -> "srgb"

let edge_modes =
  [ `CLAMP; `REFLECT; `WRAP; `ZERO ]

let filters =
  [ `DEFAULT; `BOX; `TRIANGLE; `CUBICBSPLINE; `CATMULLROM; `MITCHELL ]

let colorspaces =
  [ `LINEAR; `SRGB ]

(*let string_of_flag = function
    | `ALPHA_PREMULTIPLIED   -> "alpha_premultiplied"
    | `ALPHA_USES_COLORSPACE -> "alpha_uses_colorspace"
*)

let test ?channels ?alpha_channel name =
  match Stb_image.load ?channels "../test_pokeball.png" with
  | Result.Error (`Msg error) ->
    Printf.printf "KO cannot decode %s: %s\n%!" name error
  | Result.Ok input ->
    let w = Image_type.width input * 3 / 2 in
    let h = Image_type.height input * 3 / 2 in
    let c = Image_type.channels input in
    let buffer =
      Bigarray.Array1.create
        Bigarray.int8_unsigned Bigarray.c_layout (w * h * c)
    in
    let output =
      match Image_type.image ~width:w ~height:h ~channels:c buffer with
      | Result.Ok image -> image
      | Result.Error (`Msg x) -> failwith x
    in
    let with_settings ~edge_mode ~filter ~colorspace () =
      let name = Printf.sprintf "resize-%s-%s-%s-%s.png" name
          (string_of_edge edge_mode) (string_of_filter filter)
          (string_of_colorspace colorspace)
      in
      Stb_image_resize.resize_u8
        ?alpha_channel ~input ~output ~edge_mode ~filter ~colorspace ();
      match Stb_image_write.png name output with
      | Result.Error (`Msg msg) ->
        Printf.printf "KO cannot save %s: %s\n%!" name msg
      | Result.Ok () ->
        let digest = Digest.file name |> Digest.to_hex in
        Printf.printf "OK %s: %s\n%!" name digest
    in
    List.iter (fun edge_mode ->
        List.iter (fun filter ->
            List.iter (fun colorspace ->
                with_settings ~edge_mode ~filter ~colorspace ()
              ) colorspaces
          ) filters
      ) edge_modes

let () = (
  test "";
  test ~channels:1 "1";
  test ~channels:2 "2";
  test ~channels:3 "3";
  test ~channels:4 "4" ~alpha_channel:3;
)
