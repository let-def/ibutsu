Ibutsu is a collection of bindings to small, self-contained C libraries.
These libraries either come from or are inspired by
[Stb](https://github.com/nothings/stb/).

The goal is to expose some features, especially around multimedia, which are
not convenient to implement directly in OCaml. The libraries have no dependency
besides a libc and a C compiler, they are portable and easy to distribute. The
bindings work with native and bytecode OCaml.

The modules available are:
- `Image_type`: a simple representation for pixel maps used by other modules
- `Stb_image`: JPG, PNG, BMP, TGA, ... decoder, plus a few simple filters
- `Stb_image_write`: JPG, PNG, ... encoder
- `Stb_image_resize`: image resizer with a variety of resize filters and image
  formats
- `Stb_truetype`: truetype font (*.ttf) decoder and rasterizer
- `Minimp3`: high-quality MP3 (plus audio layer 1 and 2) decoder

[Stb](https://github.com/nothings/stb/) is released by 
[Sean T.  Barrett](http://nothings.org/) in the public domain or MIT.

[Minimp3](https://github.com/lieff/minimp3) is released by 
[Lion(?)](https://github.com/lieff) in the public domain or CC-0.

The present bindings are released in the public domain or MIT or ISC or CC-0.
