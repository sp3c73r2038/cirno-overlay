CC = cc
CFLAGS = -std=gnu11 -c -Wall -ggdb
LDFLAGS = -lpcre

SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)
EXECUTABLE = af

all: $(SOURCES) $(EXECUTABLE)

$(OBJECTS): %.o : %.c
	$(CC) $(CFLAGS) $< -o $@

$(EXECUTABLE): % : $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)

clean:
	rm -f $(EXECUTABLE) && rm -f $(OBJECTS)

