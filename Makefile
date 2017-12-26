#!/bin/env sh
CC = gcc

SRCDIR = src
OBJDIR = obj
BINDIR = bin

CFLAGS = -Wall -O3
CLIB = -lcrypto

OBJS = main.o m_md5.o

OUT = mymd5

all: dirs $(OBJS)
	$(CC) $(CFLAGS) -o $(BINDIR)/$(OUT) $(addprefix $(OBJDIR)/,$(OBJS)) $(CLIB)

%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $(OBJDIR)/$@

dirs:
	+@[ -d ./$(OBJDIR)] || mkdir $(OBJDIR)
	+@[ -d ./$(BINDIR)] || mkdir $(BINDIR)

clean:
	@rm -rf $(OBJDIR)/* $(BINDIR)/$(OUT)

fullclean: clean
	@rm -rf $(BINDIR)/* 
