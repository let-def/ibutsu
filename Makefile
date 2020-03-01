all:
	jbuilder build

clean:
	jbuilder clean

SOURCES= \
	"https://github.com/lieff/minimp3/raw/master/minimp3.h" \
	"https://github.com/nothings/stb/raw/master/stb_image.h" \
	"https://github.com/nothings/stb/raw/master/stb_image_resize.h" \
	"https://github.com/nothings/stb/raw/master/stb_image_write.h" \
	"https://github.com/nothings/stb/raw/master/stb_perlin.h" \
	"https://github.com/nothings/stb/raw/master/stb_rect_pack.h" \
	"https://github.com/nothings/stb/raw/master/stb_truetype.h" \
	"https://github.com/nothings/stb/raw/master/stb_vorbis.c"

update:
	for i in $(SOURCES); do wget -O "$$(basename "$$i")" "$$i"; done

test:
	jbuilder runtest -f

promote:
	jbuilder promote
