let () = print_endline "Stb_image & Stb_image_write (u8)"

module Read = Stb_image
module Write = Stb_image_write

let test_write name image =
  let check filename = function
    | Result.Error (`Msg msg) ->
      Printf.printf "KO write %s: %s\n%!" filename msg;
      ""
    | Result.Ok () ->
      let digest = (Digest.file filename |> Digest.to_hex) in
      Printf.printf "OK %s: %s\n%!" filename digest;
      digest
  in
  let bmp =
    let filename = name ^ ".bmp" in
    check filename (Write.bmp filename image)
  in
  let png =
    let filename = name ^ ".png" in
    check filename (Write.png filename image)
  in
  let tga =
    let filename = name ^ ".tga" in
    check filename (Write.tga filename image)
  in
  let jpg =
    let filename = name ^ ".jpg" in
    check filename (Write.jpg filename image)
  in
  let jpg100 =
    let filename = name ^ "100.jpg" in
    check filename (Write.jpg ~quality:100 filename image)
  in
  let jpg50 =
    let filename = name ^ "50.jpg" in
    check filename (Write.jpg ~quality:50 filename image)
  in
  let vflip =
    let filename = name ^ "vflip.png" in
    Stb_image.vflip image;
    let result = check filename (Write.png filename image) in
    Stb_image.vflip image;
    result
  in
  let mipmap =
    let filename = name ^ "mipmap.png" in
    match
      let w = Image_type.width image in
      let h = Image_type.height image in
      let c = Image_type.channels image in
      Image_type.image
        ~width:(w / 2)
        ~height:(h / 2)
        ~channels:c
        ~offset:10
        ~stride:(w * c)
        (Bigarray.Array1.create
           Bigarray.int8_unsigned Bigarray.c_layout
           (10 + (w * h / 2) * c))
    with
    | Result.Error (`Msg msg) ->
      "failed to allocate mipmap buffer -- " ^ msg
    | Result.Ok image' ->
      Stb_image.mipmap image image';
      check filename (Write.png filename image')
  in
  let blur =
    let filename = name ^ "blur.png" in
    Stb_image.expblur image ~radius:2.0;
    let result = check filename (Write.png filename image) in
    result
  in
  [bmp; png; tga; jpg; jpg100; jpg50; vflip; mipmap; blur]

let check_and_write ?(and_then=ignore) name = function
  | Result.Error (`Msg msg) ->
    Printf.printf "KO read %s: %s\n%!" name msg;
    []
  | Result.Ok image ->
    let result = test_write name image in
    and_then image;
    result

let check_and_write ?and_then name load decode =
  let disk = check_and_write ?and_then ("disk_" ^ name) load in
  let mem = check_and_write ?and_then ("mem_" ^ name) decode in
  if (disk <> mem) then
    Printf.printf "KO: on disk and in memory decode differ for %s\n%!" name

let padded_image = function
  | Result.Error _ as error -> error
  | Result.Ok image ->
    let w = Image_type.width image in
    let h = Image_type.height image in
    let c = Image_type.channels image in
    let offset = w * 3 / 2 in
    let stride = (w + w * 1 / 3) * c in
    let buffer =
      Bigarray.Array1.create
        Bigarray.int8_unsigned Bigarray.c_layout
        (offset + stride * h * c)
    in
    match
      Image_type.image ~width:w ~height:h ~channels:c ~offset ~stride buffer
    with
    | Result.Error _ as error -> error
    | Result.Ok image' as result ->
      Stb_image.copy image image';
      result


let () = (
  let ic = open_in_bin "../test_pokeball.png" in
  let buffer =
    Unix.map_file (Unix.descr_of_in_channel ic)
      Bigarray.int8_unsigned Bigarray.c_layout false [|in_channel_length ic|]
    |> Bigarray.array1_of_genarray
  in
  check_and_write "pokeball"
    (Read.load "test_pokeball.png")
    (Read.decode buffer);
  check_and_write "pokeball_1"
    (Read.load ~channels:1 "../test_pokeball.png")
    (Read.decode ~channels:1 buffer);
  check_and_write "pokeball_2"
    (Read.load ~channels:2 "../test_pokeball.png")
    (Read.decode ~channels:2 buffer);
  check_and_write "pokeball_3"
    (Read.load ~channels:3 "../test_pokeball.png")
    (Read.decode ~channels:3 buffer);
  check_and_write "pokeball_4"
    (Read.load ~channels:4 "../test_pokeball.png")
    (Read.decode ~channels:4 buffer);
  check_and_write "pokeball_unmanaged"
    (Read.load_unmanaged "../test_pokeball.png")
    (Read.decode_unmanaged buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_1_unmanaged"
    (Read.load_unmanaged ~channels:1 "../test_pokeball.png")
    (Read.decode_unmanaged ~channels:1 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_2_unmanaged"
    (Read.load_unmanaged ~channels:2 "../test_pokeball.png")
    (Read.decode_unmanaged ~channels:2 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_3_unmanaged"
    (Read.load_unmanaged ~channels:3 "../test_pokeball.png")
    (Read.decode_unmanaged ~channels:3 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_4_unmanaged"
    (Read.load_unmanaged ~channels:4 "../test_pokeball.png")
    (Read.decode_unmanaged ~channels:4 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "padded_pokeball_1"
    (padded_image (Read.load ~channels:1 "../test_pokeball.png"))
    (padded_image (Read.decode ~channels:1 buffer));
  check_and_write "padded_pokeball_2"
    (padded_image (Read.load ~channels:2 "../test_pokeball.png"))
    (padded_image (Read.decode ~channels:2 buffer));
  check_and_write "padded_pokeball_3"
    (padded_image (Read.load ~channels:3 "../test_pokeball.png"))
    (padded_image (Read.decode ~channels:3 buffer));
  check_and_write "padded_pokeball_4"
    (padded_image (Read.load ~channels:4 "../test_pokeball.png"))
    (padded_image (Read.decode ~channels:4 buffer));
  close_in ic;
)
