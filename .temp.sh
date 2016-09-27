#!/bin/bash
 sensors | grep "Physical" | cut -d'+' -f2 | cut -d' ' -f1
