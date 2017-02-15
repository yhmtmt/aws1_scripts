#!/bin/sh

zgpio /dev/zgpio1 set2 10000000
usleep ${1}000
zgpio /dev/zgpio1 set2 00000000
usleep ${1}000
zgpio /dev/zgpio1 set2 10000000
usleep ${1}000
zgpio /dev/zgpio1 set2 00000000


