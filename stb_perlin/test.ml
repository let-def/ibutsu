[@@@ocaml.warning "-6"]
open Stb_perlin

let pf f =
  print_float f;
  print_newline ()

let () = (
  print_endline "Stb_perlin.noise3";
  pf (noise3 0.0 2.0 4.0 1 1 1);
  pf (noise3 0.1 2.0 4.0 1 2 1);
  pf (noise3 0.1 2.1 4.0 1 2 4);
  pf (noise3 0.1 2.1 4.1 4 2 1);
)

let () = (
  print_endline "Stb_perlin.ridge_noise3";
  pf (ridge_noise3 0.0 2.0 4.0 1.0 1.0 0.0 1);
  pf (ridge_noise3 0.1 2.0 4.0 1.0 1.0 0.0 1);
  pf (ridge_noise3 0.1 2.1 4.0 1.0 1.0 0.0 1);
  pf (ridge_noise3 0.1 2.1 4.1 1.0 1.0 0.0 1);
)

let () = (
  print_endline "Stb_perlin.fbm_noise3";
  pf (fbm_noise3 0.0 2.0 4.0 1.0 1.0 1);
  pf (fbm_noise3 0.1 2.0 4.0 1.0 1.0 1);
  pf (fbm_noise3 0.1 2.1 4.0 1.0 1.0 1);
  pf (fbm_noise3 0.1 2.1 4.1 1.0 1.0 1);
)

let () = (
  print_endline "Stb_perlin.turbulence_noise3";
  pf (turbulence_noise3 0.0 2.0 4.0 1.0 1.0 1);
  pf (turbulence_noise3 0.1 2.0 4.0 1.0 1.0 1);
  pf (turbulence_noise3 0.1 2.1 4.0 1.0 1.0 1);
  pf (turbulence_noise3 0.1 2.1 4.1 1.0 1.0 1)
)
