# GeBR Menus SU - Seismic Unix menus for GeBR
# Copyright (C) 2008-2010 Ricardo Biloti <biloti@gebrproject.com>
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

AC_INIT(menus/suplane.mnu)

PACKAGE=gebr-menus-su
VERSION=0.7.1
AC_SUBST(PACKAGE)
AC_SUBST(VERSION)

AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
PACKAGE_NAME=$PACKAGE
PACKAGE_VERSION=$VERSION

AC_PROG_INSTALL
AC_PROG_CC

AC_OUTPUT( Makefile
           menus/Makefile
           demos/Makefile
           scripts/Makefile
           packages/Makefile
           packages/rpm/gebr-menus.spec )

