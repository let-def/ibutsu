let () =
  print_endline "Stb_perlin";
  let open Stb_perlin in

  let pf f =
    print_float f;
    print_newline ()
  in

  print_endline "Stb_perlin.noise3";
  pf (noise3 0.0 2.0 4.0 1 1 1);
  pf (noise3 0.1 2.0 4.0 1 2 1);
  pf (noise3 0.1 2.1 4.0 1 2 3);
  pf (noise3 0.1 2.1 4.1 3 2 1);

  print_endline "Stb_perlin.ridge_noise3";
  pf (ridge_noise3 0.0 2.0 4.0 1.0 1.0 0.0 1 1 1 1);
  pf (ridge_noise3 0.1 2.0 4.0 1.0 1.0 0.0 1 1 2 1);
  pf (ridge_noise3 0.1 2.1 4.0 1.0 1.0 0.0 1 1 1 3);
  pf (ridge_noise3 0.1 2.1 4.1 1.0 1.0 0.0 1 1 1 1);

  print_endline "Stb_perlin.fbm_noise3";
  pf (fbm_noise3 0.0 2.0 4.0 1.0 1.0 1 1 1 1);
  pf (fbm_noise3 0.1 2.0 4.0 1.0 1.0 1 1 2 1);
  pf (fbm_noise3 0.1 2.1 4.0 1.0 1.0 1 1 1 3);
  pf (fbm_noise3 0.1 2.1 4.1 1.0 1.0 1 1 1 1);

  print_endline "Stb_perlin.turbulence_noise3";
  pf (turbulence_noise3 0.0 2.0 4.0 1.0 1.0 1 1 1 1);
  pf (turbulence_noise3 0.1 2.0 4.0 1.0 1.0 1 1 2 1);
  pf (turbulence_noise3 0.1 2.1 4.0 1.0 1.0 1 1 1 3);
  pf (turbulence_noise3 0.1 2.1 4.1 1.0 1.0 1 1 1 1)
;;

let () =
  print_endline "Minimp3";
  let open Minimp3 in
  let t = make () in
  let input =
    "\255\243\136\196\000\000\000\000\000\000\000\000\000Xing\000\000\000\015\
     \000\000\000\011\000\000\t$\000BBBBBBBBB\\\\\\\\\\\\\\\\\\vvvvvvvvv\137\
     \137\137\137\137\137\137\137\137\157\157\157\157\157\157\157\157\157\176\
     \176\176\176\176\176\176\176\176\193\193\193\193\193\193\193\193\193\209\
     \209\209\209\209\209\209\209\209\225\225\225\225\225\225\225\225\225\250\
     \250\250\250\250\250\250\250\250\250\250\250\250\250\250\250\250\250\000\
     \000\000,LAME3.82\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
     \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
     \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
     \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
     \000\000\000\000\000\000\000\000BBBBBBBBB\\\\\\\\\\\\\\\\\\vvvvvvvvv\137\
     \137\137\137\137\137\137\137\137\157\157\157\157\157\157\157\157\157\176\
     \176\176\176\176\176\176\176\176\193\193\193\193\193\193\193\193\193\209\
     \209\209\209\209\209\209\209\255\243\152\196\000K\212\nD\001\158\176\000\
     \255\171\0180\129\015\003\024 \154\255q\028\211\015p\2030?-\143\248\025\
     \150\026%\024\001\129Hx\240\250\b.[\003\195\205\168\012\196\190P7\162v\
     \252\242h\018\192i\253\026\129\147\177L\006^\006\224\027\142-_'\212\\:O\
     \129\1534\030\006PB\152\025L\021@bd\181\129\151qk\250i\026\030>h\006GL\b\
     \025\031\024\192g8\140\001\164\194\204\006\015\001\168\015\000\031\217\205\
     \0159\163\001\135@\232\006\027\130p,\011\000\193\160l\003\018\193\248\006\
     \131 \024,\t_\244\141\015:\021 \192a\224G\001\135\000D\006:\005\144\024N\
     \003\160al\022\128\161\023\003\016B\128\0123\001@1\164\027\191\253>\239\
     \248\021\005\160\028\r\193\192\016\012\012\132\0160\142\005\192\195\024A\
     \003\000\224(\012\015\000A\021\003\001 <\006\128x\024/\003\255\255\255\255\
     \129 \020\002\128\016\006\0018\\\225\015\006\199\193 \000\002\12808\208m\
     \153$\005\128\024_\193>\001\129\160\r\255\255\255\255\254#\017\007\131cbD\
     \023\208;\001\128\199\178L\149\0250l\022\026\172w\131b\198\176\165\021\000\
     %d\203L\207M\020A\225\151\025\004\173\024B\177~\194(a\227\162\022\244\029`\
     \136\211pT\250nA\021\007p\016\132:\170\155\236\255\243h\196+8\187>\200\007\
     \153\192\001\181ZZ\023\135a*\146\228\182-\209:\221H\203%rmH\212\017\147\
     \218N\007\1382\232\210V\228\170\255i\250\214K\000QVZ\202!\011\230\024\131\
     &Zl!\195\145>\137\215\007\195\159\216\164m\251\138a\017uh\223g\250\207\183\
     \236\162\004N\136\235\247\025\183-\228\166\154j_;\021\148\216\165\199\157\
     \2393gqxn_\131\191\015\207\206s\234R\209\229\150\247\158\187Kr\1752\199\
     \153\1275\255\249\247\015\195\159\255\2473\169_Xe\141\158\254\191\029\239\
     \012q\222<\203\247\207\253~\181\135;\223\215\239\255\159c\154\203Y\215\149\
     *t\135\031\253\148\222\133F\248G~\221\173\205\175\142S\254\156\1368\000@\
     \237Y\021\188\002\002K\193\227n\002d\255\243x\196\0198+\242\216\007\204x\
     \001%\130\168H\131\169\243\004s$\234W6F9\147\240\154\155\245\r\138Wud?\220\
     \145\017\015t\130\176\195\031\234\240\191#\142\194\177\n0\197R\0160\005\
     \221\132\152\135\017\146\\D\232\195:M@\193\145x#Hk\209]V?\185)C\023\208\
     \215\0075\011F\2211BnR\197\195\197\203'\195TjB\196JKl\194\183\250\213\247<\
     J\193\158\241ej\127\ni\230\132\200\207\003\227zq\167\164\140o1#\rb@\187^\
     \159C\196|k\210\030\023\019\180\248\219\162\204(N1\027U\141I\216\214\172\
     \006Hm\140\204\186\134\217\168\145\031\2351_?\129&kl\186\140\2235\029[qm\
     \247\226\218>^_r\223>\147\195\137%a\255\233\029\195p.\181R\255?\006*E\208D\
     \192n\022\021#b\172\218\150\157nAl\146\174RX\252\178^\245SV\157\185\255\
     \243X\196!(\235\174\216\006\195\007M^\000\129\0297\130\003\148G\241\128#n\
     \005\214\029\006,hi\202~\227N\1818\017\017LOe\214\138\192\216*^\rD\146\176\
     \148\189['\140\019\018\190\130\165\251\201\201\203/\209\214u\255Mh\182\150\
     \215i\249k; \163&\217v;\249\195~\252V\018\177\179fXj]\193m\024{\179y\177\
     \253\006\187s\171\220\151\218\n.\025\243\255\254\148\218\252o\252\233\179\
     F\r\014\031\231\252f:=\020\154\021\183\136\134\218*\238\219\016\006i\232o\
     V\b\148\214\r`\139fY\215M\238r\218L0\215e\174\203\138\2493\nW\220\144\"\
     \255\243X\196$)\219\210\196\006\203\198\221\202\211\184\129.\024\012\173mN\
     \165F\1957\\\020\nF7L(Zq\181D\244\220?\018)\020S\213M\163;>\144GO]\167\136\
     \200\253\141\216\147\202\248\177b\192\143\140\189{3U\180\218\245\237f\147\
     \238\180\219\253k\227\243\158\199\1691,?\164V\193\251\163k\185\219\240\206\
     \157Vi\250el\153\195\252\223\1412+Y\1636J\164\200y\205waT\167Kl\167v\135\
     \223(|Zf]\237C{\146\139%%5\n\155\242 \000Bg\160X\016@\026R\243Q\213\160\
     \181\219\140\r\016\175K\r\203\216\170s\003Q\204+\011\012\255\243H\196#&\
     \218\222\188\014\211\006\189\192\020\b\140K\133S{\003A\236\184t^\029\131\
     \210\r\199a\240'\015W\015@\212A=\136\233\029\143P\168\189\148\196\231\227H\
     \156\205\2190\133g\242\138/\202\167\166\023^\231\150\031\147G\135\175\216f\
     \150\210\164\250\254\222|\165V\229\014\028;\170\1473$>|co\201o\244\143\128\
     \203\"-\159\202\015\179\190r\255g(\235\006\205\240\165\031\230\222\142l\
     \022g\1857\255\240(T\234\001\156\191\143b\148\135p\230\t\255\243X\196\n%#z\
     \172\022\203\006\209JA\150\184.R\205\144\181'\225\224u]\185d2\203\024\019^\
     \156\148\220\154\145Q\225\218\144\026\169\016\148\156\026\146A\176\236\218\
     \223\147\200c\179\190\1652;\197\r\175vD\138\0023\138\0024j$`\204\223\207*\
     \180\227\210R\194\150\206z\169\163\127u)II\148\150\189\165x\249)B\227\252 \
     \185\185mt\191\025\239>\2313m\184\176\229\223V\249\194[K\217\132\198A\197\
     \138c\133\186\180xz\140\206\184>\019>o\028\232&-\192\218\001\147s\011\228h\
     D\217\003\001@aJ\2190\149\217\175\232\156\205\216\205X\021\028\132W\255\
     \243H\196\028 2b\156\022\195\006\173\150\198\204V\018\197QV\204\211\184\
     \234\186\238\248\tX\0226'\022\189}H\151[v\133\229\149\250\\\210\182{T,\243\
     >f\225\225&z\158D\219\017\161\222\147\020R\145\154\234\230.D3;\171\160\216\
     D\184\198\232: Ie \138A%\167k\255+\190\237/u\128\243\213m\017\161\012\128\
     L\212\177P}\r\239nRB%\209\164\166\002\158\1392\184\155\167\005\188\177(\
     \180\174QA\n\151\193+\246]\221\227j\212\255\243H\196\030 k&\148\015X\024\
     \001V\237\150R\006h)\195\012F8hm\024\137\138\145\153\154ea\138d\174f\243\
     \133]K\233v\242\166h\176\205t\244\140\250\153\162\218D~M\209\019\006qKU\r\
     \164\206\197\244&*y\207)\219\247:y\161\018\149-_\144\161\030\218\216^\151\
     \018\193\236\226\b\205\023\182z\\\237\207&\150\025B\245\029vQ\172\2216\007\
     ,=\142<`P\255\249\136i\185\129\128\188b\183\248\128\0191\192\195\191\143\
     \248\025J`{\255\243h\196\0317\011j\024\001\157\160\0000\129\200\130b\165\
     \2401&\129\179\224(\004\000J\"\223\129\139\012\006\166\128b\144\r\028\006\
     LeJ\254\000\130B\000\192\224\192c\217\0004\224\012\011\255\224\002P\000\
     \141\001\139<n\022\130\002\229\006[\255\241B\134Y\001\225\128\201\144\012\
     \208\015\004\006\012\000\024\211\129t\127\255\240\248\000\198\156,\007$\
     \000!\128H\1601\163\128\206\172\000\147\000i\207\000q\"\t\254\175\255\224\
     \002\b$$B\192\221\016\203\128D\016\025S\192iU\002\016@fO\001\153(\000\132@\
     \145P\001\028\004\003\255R\170\255\255\224e\011\129\138\002\030\144^ d\145\
     \133\210\016\184\024\000\2269\018\192\180aI\r\176\198\163\028=\133\146\170\
     LAME3.82\170\170\170\170\170\255\243\024\196\r\000\000\003H\001\192\000\
     \000\170\170\170\170\170\170\170\170\170\170\170\170\170\170\170\170\170\
     \170\170\170\170\170\170"
  in
  let pcm =
    Bigarray.Array1.create
      Bigarray.int16_signed Bigarray.c_layout buffer_size
  in
  let average (pcm : samples) count =
    let sum = ref 0.0 in
    for i = 0 to count - 1 do
      sum := !sum +. float pcm.{i}
    done;
    !sum /. float count
  in
  let frame = empty_frame () in
  frame.frame_bytes <- -1;
  let offset = ref 0 in
  while frame.frame_bytes <> 0 && !offset < String.length input do
    let samples =
      decode_string t input
        ~offset:!offset ~length:(String.length input - !offset) pcm frame
    in
    Printf.printf
      "samples = %d average = %f\n\
       { frame_bytes = %d; channels = %d; hz = %d; \
       layer = %d; bitrate_kbps = %d }\n"
      samples (average pcm samples)
      frame.frame_bytes frame.channels frame.hz frame.layer frame.bitrate_kbps;
    offset := !offset + frame.frame_bytes
  done
;;

let () =
  print_endline "Stb_image & Stb_image_write (u8)";
  let module Read = Stb_image in
  let module Write = Stb_image_write in
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
  in
  let check_and_write ?(and_then=ignore) name = function
    | Result.Error (`Msg msg) ->
      Printf.printf "KO read %s: %s\n%!" name msg;
      []
    | Result.Ok image ->
      let result = test_write name image in
      and_then image;
      result
  in
  let check_and_write ?and_then name load decode =
    let disk = check_and_write ?and_then ("disk_" ^ name) load in
    let mem = check_and_write ?and_then ("mem_" ^ name) decode in
    if (disk <> mem) then
      Printf.printf "KO: on disk and in memory decode differ for %s\n%!" name
  in
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
  in
  let ic = open_in_bin "test_pokeball.png" in
  let buffer = Bigarray.Array1.map_file (Unix.descr_of_in_channel ic)
      Bigarray.int8_unsigned Bigarray.c_layout false (in_channel_length ic)
  in
  check_and_write "pokeball"
    (Read.load "test_pokeball.png")
    (Read.decode buffer);
  check_and_write "pokeball_1"
    (Read.load ~channels:1 "test_pokeball.png")
    (Read.decode ~channels:1 buffer);
  check_and_write "pokeball_2"
    (Read.load ~channels:2 "test_pokeball.png")
    (Read.decode ~channels:2 buffer);
  check_and_write "pokeball_3"
    (Read.load ~channels:3 "test_pokeball.png")
    (Read.decode ~channels:3 buffer);
  check_and_write "pokeball_4"
    (Read.load ~channels:4 "test_pokeball.png")
    (Read.decode ~channels:4 buffer);
  check_and_write "pokeball_unmanaged"
    (Read.load_unmanaged "test_pokeball.png")
    (Read.decode_unmanaged buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_1_unmanaged"
    (Read.load_unmanaged ~channels:1 "test_pokeball.png")
    (Read.decode_unmanaged ~channels:1 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_2_unmanaged"
    (Read.load_unmanaged ~channels:2 "test_pokeball.png")
    (Read.decode_unmanaged ~channels:2 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_3_unmanaged"
    (Read.load_unmanaged ~channels:3 "test_pokeball.png")
    (Read.decode_unmanaged ~channels:3 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "pokeball_4_unmanaged"
    (Read.load_unmanaged ~channels:4 "test_pokeball.png")
    (Read.decode_unmanaged ~channels:4 buffer)
    ~and_then:Read.free_unmanaged;
  check_and_write "padded_pokeball_1"
    (padded_image (Read.load ~channels:1 "test_pokeball.png"))
    (padded_image (Read.decode ~channels:1 buffer));
  check_and_write "padded_pokeball_2"
    (padded_image (Read.load ~channels:2 "test_pokeball.png"))
    (padded_image (Read.decode ~channels:2 buffer));
  check_and_write "padded_pokeball_3"
    (padded_image (Read.load ~channels:3 "test_pokeball.png"))
    (padded_image (Read.decode ~channels:3 buffer));
  check_and_write "padded_pokeball_4"
    (padded_image (Read.load ~channels:4 "test_pokeball.png"))
    (padded_image (Read.decode ~channels:4 buffer));
  (*print_endline (match Sys.backend_type with
      | Sys.Native -> "Native"
      | Sys.Bytecode -> "Bytecode"
      | Sys.Other x -> x);*)
  close_in ic
;;


let () =
  print_endline "Stb_image_resize (u8)";
  let string_of_edge = function
    | `CLAMP -> "clamp"
    | `REFLECT -> "reflect"
    | `WRAP -> "wrap"
    | `ZERO -> "zero"
  in
  let string_of_filter = function
    | `DEFAULT      -> "default"
    | `BOX          -> "box"
    | `TRIANGLE     -> "triangle"
    | `CUBICBSPLINE -> "cubicbspline"
    | `CATMULLROM   -> "catmullrom"
    | `MITCHELL     -> "mitchell"
  in
  let string_of_colorspace = function
    | `LINEAR -> "linear"
    | `SRGB   -> "srgb"
  in
  let edge_modes =
    [ `CLAMP; `REFLECT; `WRAP; `ZERO ]
  and filters =
    [ `DEFAULT; `BOX; `TRIANGLE; `CUBICBSPLINE; `CATMULLROM; `MITCHELL ]
  and colorspaces =
    [ `LINEAR; `SRGB ]
  in
  (*let string_of_flag = function
    | `ALPHA_PREMULTIPLIED   -> "alpha_premultiplied"
    | `ALPHA_USES_COLORSPACE -> "alpha_uses_colorspace"
  in*)
  let test ?channels ?alpha_channel name =
    match Stb_image.load ?channels "test_pokeball.png" with
    | Result.Error (`Msg error) ->
      Printf.printf "KO cannot decode %s: %s" name error
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
  in
  test "";
  test ~channels:1 "1";
  test ~channels:2 "2";
  test ~channels:3 "3";
  test ~channels:4 "4" ~alpha_channel:3
;;
