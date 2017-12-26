#!/bin/env sh
CC = gcc

SRCDIR = src
OBJDIR = obj
BINDIR = bin

CFLAGS = -Wall -O3
CLIB = -lcrypto

OBJS = main.o m_md5.o m_md4.o
OBJS1 = md5_main.o m_md5.o m_md4.o
OBJS2 = md4_main.o m_md5.o m_md4.o

OUT = my_tools
OUT1 = mymd5
OUT2 = mymd4

all: dirs $(OBJS) $(OBJS1) $(OBJS2)
	$(CC) $(CFLAGS) -o $(BINDIR)/$(OUT) $(addprefix $(OBJDIR)/,$(OBJS)) $(CLIB)
	$(CC) $(CFLAGS) -o $(BINDIR)/$(OUT1) $(addprefix $(OBJDIR)/,$(OBJS1)) $(CLIB)
	$(CC) $(CFLAGS) -o $(BINDIR)/$(OUT2) $(addprefix $(OBJDIR)/,$(OBJS2)) $(CLIB)

%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $(OBJDIR)/$@

dirs:
	+@[ -d ./$(OBJDIR)] || mkdir $(OBJDIR)
	+@[ -d ./$(BINDIR)] || mkdir $(BINDIR)

clean:
	@rm -rf $(OBJDIR)/* $(BINDIR)/$(OUT)

fullclean: clean
	@rm -rf $(BINDIR)/* 
