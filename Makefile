CFLAGS = -std=c99 -Wall
LDFLAGS = -lspotify -levent -levent_pthreads -ljansson
SOURCES = appkey.c account.c diff.c json.c server.c

override CFLAGS += $(shell --cflags --includes)

override LDFLAGS += $(shell --link-ld --libs)

all: $(SOURCES) server

server:
	$(CC) $(CFLAGS) $(SOURCES) $(LDFLAGS) -o $@

clean:
	rm -f *.o server
	rm -rf .settings .cache

