.PHONY: all clean update test promote

all:
	dune build

clean:
	dune clean

SOURCES= \
	"https://github.com/lieff/minimp3/raw/master/minimp3.h" \
	"https://github.com/nothings/stb/raw/master/stb_image.h" \
	"https://github.com/nothings/stb/raw/master/stb_image_resize.h" \
	"https://github.com/nothings/stb/raw/master/stb_image_write.h" \
	"https://github.com/nothings/stb/raw/master/stb_rect_pack.h" \
	"https://github.com/nothings/stb/raw/master/stb_truetype.h" \
	"https://github.com/nothings/stb/raw/master/stb_vorbis.c"

update:
	for i in $(SOURCES); do \
		BASENAME="$$(basename "$$i")"; \
		DIRECTORY="$${BASENAME%.*}"; \
		wget -O "$$DIRECTORY/$$BASENAME" "$$i"; done

test:
	dune runtest -f

promote:
	dune promote
