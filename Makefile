# Copyright (c) 2012, Chris Winter <wintercni@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#    1. Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#    2. Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#    3. Neither the name of the copyright holder nor the
#       names of contributors may be used to endorse or promote products
#      derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

CC = gcc
CFLAGS = -Wall -Werror -O0 -ansi -pedantic -g
INCLUDES = -I./ -I/usr/local/include
LIBS =

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

OBJS= \
	ext/seatest/seatest.o \
	utilities.o \
	darray.o \
	slist.o \
	dlist.o \
	stack.o \
	queue.o \
	deque.o \
	heap.o \
	priority_queue.o \
	rbtree.o

all: $(OBJS) tests

.PHONY: tests
tests:
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-darray.c -o unit-tests/test-darray
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-slist.c -o unit-tests/test-slist
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-dlist.c -o unit-tests/test-dlist
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-stack.c -o unit-tests/test-stack
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-queue.c -o unit-tests/test-queue
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-deque.c -o unit-tests/test-deque
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-heap.c -o unit-tests/test-heap
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-priority-queue.c -o unit-tests/test-priority-queue
	$(CC) $(CFLAGS) $(INCLUDES) -I./ext/seatest/ $(LIBS) $(OBJS) unit-tests/test-rbtree.c -o unit-tests/test-rbtree

.PHONY: clean
clean:
	rm *.o \
		unit-tests/test-darray \
		unit-tests/test-slist \
		unit-tests/test-dlist \
		unit-tests/test-stack \
		unit-tests/test-queue \
		unit-tests/test-deque \
		unit-tests/test-heap \
		unit-tests/test-priority-queue \
		unit-tests/test-rbtree
