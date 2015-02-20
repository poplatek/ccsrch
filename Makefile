#
# ccsrch (c) 2012 - 2014 Adam Caudill <adam@adamcaudill.com>
#        (c) 2007 Mike Beekey <zaphod2718@yahoo.com>
# All rights reserved
#
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#
# Makefile for ccsrch
#

CC	?= gcc
INCL	= -I./
OBJS=  ccsrch.o
LIBSDIR	=  -L./
LIBS	= 
PROGS	=ccsrch ccsrch_osx ccsrch_win32.exe

#this hack is to support OSX
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
  CFLAGS	=-O2
  LDFLAGS	=
else
  CFLAGS	=-O2 -static
  LDFLAGS	=-s
endif

strict: CFLAGS += -pedantic -Wall -Werror

all:	${PROGS}

ccsrch:	${OBJS}
	${CC} ${CFLAGS} ${INCL} ${LDFLAGS} ${OBJS} ${LIBSDIR} ${LIBS} -o ccsrch

# You need Win32 cross compiler from http://mxe.cc/#download
# (or compile natively in Win32 with MinGW with "make")
ccsrch_win32.exe:
	CC=i686-pc-mingw32-gcc LD=i686-pc-mingw32-ld AR=i686-pc-mingw32-ar PKG_CONFIG=i686-pc-mingw32-pkg-config i686-pc-mingw32-gcc  -Wall ccsrch.c -o ccsrch_win32.exe

# You need OSX cross compiler from https://github.com/tpoechtrager/osxcross
# (or compile natively in OSX with "make")
ccsrch_osx:
	o64-clang -Wall ccsrch.c -o ccsrch_osx

strict:	${PROGS}

clean:
	rm -f core *.core ${PROGS} ${OBJS} ccsrch ccsrch_osx ccsrch_win32.exe

.c.o:
	${CC} ${CFLAGS} ${INCL} -c $<

install:
	cp ccsrch /usr/local/bin/
	chmod 4755 /usr/local/bin/ccsrch

