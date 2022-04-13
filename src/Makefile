CFLAGS += -ggdb -Wall -ansi -pedantic
LDFLAGS += -lm

locality.c pad.c: cod.c
trash += locality locality.c cod.c

perf: pad
	for i in 10 13 14 15 16 19 22 28 31; do\
		perf stat -B -e cache-references,cache-misses,cycles,instructions,branches,faults,migrations --log-fd 1 ./pad $$i;\
	done

.PHONY: clean perf
clean:
	$(RM) $(trash)
