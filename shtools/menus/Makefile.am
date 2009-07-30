# GeBR Menus Shell Tools - Several shell tools for GeBR
# Copyright (C) 2008-2009 Ricardo Biloti <biloti@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

gebrmenudir = $(datadir)/gebr/menus/shtools
gebrmenu_DATA = \
		cal.mnu \
		cat.mnu \
		catdoc.mnu \
		ddconv.mnu \
		df.mnu \
		du.mnu \
		elinks.mnu \
		ls.mnu \
		odt2txt.mnu \
		pdftopsacro.mnu \
		save.mnu \
		uname.mnu \
		uptime.mnu \
		xlhtml.mnu

install:
	bash -c 'for f in ${gebrmenu_DATA}; do cp $$f $$f.bak; done'
	bash -c 'for f in ${gebrmenu_DATA}; do gebr-geoxml-menu-edit -F shtools/$$f $$f; done'
	make install-data
	bash -c 'for f in ${gebrmenu_DATA}; do mv $$f.bak $$f; done'

EXTRA_DIST = $(gebrmenu_DATA)
