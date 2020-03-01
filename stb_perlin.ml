external noise3 :
  x:(float [@unboxed]) -> y:(float [@unboxed]) -> z:(float [@unboxed]) ->
  x_wrap:(int [@untagged]) -> y_wrap:(int [@untagged]) -> z_wrap:(int [@untagged]) ->
  (float [@unboxed])
  = "ml_stb_perlin_noise3_bc" "ml_stb_perlin_noise3" [@@noalloc]

external ridge_noise3 :
  x:(float [@unboxed]) -> y:(float [@unboxed]) -> z:(float [@unboxed]) ->
  lacunarity:(float [@unboxed]) ->
  gain:(float [@unboxed]) ->
  offset:(float [@unboxed]) ->
  octaves:(int [@untagged]) ->
  x_wrap:(int [@untagged]) -> y_wrap:(int [@untagged]) -> z_wrap:(int [@untagged]) ->
  (float [@unboxed])
  = "ml_stb_perlin_ridge_noise3_bc" "ml_stb_perlin_ridge_noise3" [@@noalloc]

external fbm_noise3 :
  x:(float [@unboxed]) -> y:(float [@unboxed]) -> z:(float [@unboxed]) ->
  lacunarity:(float [@unboxed]) ->
  gain:(float [@unboxed]) ->
  octaves:(int [@untagged]) ->
  x_wrap:(int [@untagged]) -> y_wrap:(int [@untagged]) -> z_wrap:(int [@untagged]) ->
  (float [@unboxed])
  = "ml_stb_perlin_fbm_noise3_bc" "ml_stb_perlin_fbm_noise3" [@@noalloc]

external turbulence_noise3 :
  x:(float [@unboxed]) -> y:(float [@unboxed]) -> z:(float [@unboxed]) ->
  lacunarity:(float [@unboxed]) ->
  gain:(float [@unboxed]) ->
  octaves:(int [@untagged]) ->
  x_wrap:(int [@untagged]) -> y_wrap:(int [@untagged]) -> z_wrap:(int [@untagged]) ->
  (float [@unboxed])
  = "ml_stb_perlin_turbulence_noise3_bc" "ml_stb_perlin_turbulence_noise3" [@@noalloc]
