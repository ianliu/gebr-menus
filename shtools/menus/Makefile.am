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

gebrmenudir = $(DESTDIR)$(datadir)/gebr/menus/shtools
gebrmenu_DATA = \
		append.mnu \
		cal.mnu \
		catdoc.mnu \
		cat.mnu \
		cp.mnu \
		ddconv.mnu \
		df.mnu \
		du.mnu \
		echo.mnu \
		elinks.mnu \
		evince.mnu \
		gcc.mnu \
		gnutar.mnu \
		gzip.mnu \
		ls.mnu \
		odt2txt.mnu \
		pdftopsacro.mnu \
		rm.mnu \
		save.mnu \
		sort.mnu \
		uname.mnu \
		uptime.mnu \
		wget.mnu \
		xlhtml.mnu \
		xmessage.mnu \
		zenity.mnu

EXTRA_DIST = $(gebrmenu_DATA)

install-data-hook:
	gebr-geoxml-menu-indices $(gebrmenudir) $(gebrmenudir)/menus.idx2   $(gebrmenudir)/categories.idx2