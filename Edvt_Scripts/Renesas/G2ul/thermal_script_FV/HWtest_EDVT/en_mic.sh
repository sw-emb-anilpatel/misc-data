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

amixer -q cset name='Mic 1 Volume' 74%
amixer -q cset name='Mic 1 Switch' on

amixer -q cset name='Mic 1 Amp Source MUX' 'MIC_P'
amixer -q cset name='Mixin Left Mic 1 Switch' on
amixer -q cset name='Mixin Right Mic 1 Switch' on
amixer -q cset name='Mixin PGA Volume' 50
amixer -q cset name='Mixin PGA Switch' on
amixer -q cset name='ADC Volume' 76%
amixer -q cset name='ADC Switch' on

