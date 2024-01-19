#!/bin/sh
# Copyright (C) 2021 AVNET Embedded, MSC Technologies GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation version 2.
# 
# This program is distributed "as is" WITHOUT ANY WARRANTY of any
# kind, whether express or implied; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

amixer -q cset name='Headphone Volume' 80%
amixer -q cset name='Headphone Switch' on

amixer -q cset name='DAC Volume' 95%
amixer -q cset name='DAC EQ Switch' on
amixer -q cset name='DAC EQ1 Volume' 65%
amixer -q cset name='DAC EQ2 Volume' 50%
amixer -q cset name='DAC EQ3 Volume' 50%
amixer -q cset name='DAC EQ4 Volume' 60%
amixer -q cset name='DAC EQ5 Volume' 85%

amixer -q cset name='Mixout Right DAC Right Switch' on
amixer -q cset name='Mixout Left DAC Left Switch' on

