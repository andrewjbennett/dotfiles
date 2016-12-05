#!/usr/bin/python 
import sys
import datetime

if len(sys.argv) != 2:
    print "usage: python timestamp.py timestamp"
    print "eg python timestamp.py 1475251432"
    exit()

print datetime.datetime.fromtimestamp(int(sys.argv[1]))

