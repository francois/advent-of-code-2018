#!/bin/sh
awk '{ sum += $1 } ; END { print sum }'
