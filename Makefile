CFLAGS = -Wall -g

# This is the tarball name.
DIST = lab3-design

# When adding .c files, append them to this list.
SRCS = main.c ospfsfix.c

# When adding .h files, append them to this list.
HDRS = ospfs.h ospfsfix.h

# When adding other files, append them to this list.
OTHERS = Makefile README.md test_images fs_badblocknum.img fs_badeverything.img fs_badfirstinode.img fs_badinodenum.img fs_badmagic.img fs_correct.img

ospfsfix: clean $(SRCS)
	@printf "MAKING OSPFSFIX\n"
	gcc $(CFLAGS) -o ospfsfix $(SRCS)

dist: ospfsfix clean
	@printf "MAKING TARBALL\n"
	rm -rf $(DIST)
	mkdir $(DIST)
	cp $(SRCS) $(HDRS) $(OTHERS) $(DIST)/
	tar cvf $(DIST).tar.gz $(DIST)

clean:
	@printf "CLEANING\n"
	rm -rf ospfsfix
	rm -rf $(DIST).tar.gz
	rm -rf $(DIST)

test: ospfsfix
	@printf "Testing\n"
	./test_images