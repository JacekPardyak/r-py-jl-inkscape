#!/usr/bin/env python
# coding=utf-8
#
# Copyright (C) [2022] [Jacek Pardyak], [jacek.pardyak@gmail.com]
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
"""
Description of this extension
"""

import inkex
from inkex import command

class PyScriptPlot(inkex.CallExtension):

    input_ext = 'py'
    output_ext = 'svg'

    def call(self, input_file, output_file):
        command.call('python', input_file, output_file)

if __name__ == '__main__':
    PyScriptPlot().run()
