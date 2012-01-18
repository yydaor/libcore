/* Copyright (c) 2012, Chris Winter <wintercni@gmail.com>
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *    1. Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *    2. Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *    3. Neither the name of the copyright holder nor the
 *       names of contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>

#include <stdlib.h>

#include "darray.h"

int main(int argc, char *argv[])
{
    DArray *a;
    int i, *ip;

    a = darray_create();

    /* Add a bunch of ints */
    for(i = 0; i < 100000; i++) {
        ip = malloc(sizeof(int));
        if(ip != NULL) {
            *ip = i;
            darray_append(a, ip);
        }
    }

    printf("Array length: %lu\n", darray_get_length(a));
    printf("Array capacity: %lu\n", darray_get_capacity(a));
    printf("a[0]: %d\n", *(int *)darray_index(a, 0));
    printf("a[1]: %d\n", *(int *)darray_index(a, 1));
    printf("a[2]: %d\n", *(int *)darray_index(a, 2));

    /* Remove some elements */
    for(i = 100000 - 1; i > 50000; i--) {
        ip = darray_remove(a, i);
        free(ip);
    }

    printf("Array length: %lu\n", darray_get_length(a));
    printf("Array capacity: %lu\n", darray_get_capacity(a));
    printf("a[0]: %d\n", *(int *)darray_index(a, 0));
    
    darray_free_all(a);
    a = darray_create();

    /* prepend a bunch of ints */
    for(i = 0; i < 5000; i++) {
        ip = malloc(sizeof(int));
        if(ip != NULL) {
            *ip = i;
            darray_prepend(a, ip);
        }
    }

    printf("Array length: %lu\n", darray_get_length(a));
    printf("Array capacity: %lu\n", darray_get_capacity(a));
    printf("a[0]: %d\n", *(int *)darray_index(a, 0));

    ip = malloc(sizeof(int));
    if(ip != NULL) {
        *ip = 12345;
        darray_insert(a, ip, 0);
    }

    printf("Array length: %lu\n", darray_get_length(a));
    printf("Array capacity: %lu\n", darray_get_capacity(a));
    printf("a[0]: %d\n", *(int *)darray_index(a, 0));

    darray_free_all(a);

    return 0;
}
