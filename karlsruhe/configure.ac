# GeBR Menus for Karlsruhe programs
# Copyright (C) 2010 Luis A. D'Afonseca <luis.dafonseca@gebrproject.com>
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

AC_INIT(menus/crsstack.mnu)

PACKAGE=gebr-menus-karlsruhe
VERSION=0.1.0
AC_SUBST(PACKAGE)
AC_SUBST(VERSION)

AM_INIT_AUTOMAKE($PACKAGE,$VERSION)
PACKAGE_NAME=$PACKAGE
PACKAGE_VERSION=$VERSION

AC_PROG_INSTALL
AC_PROG_CC

AC_OUTPUT( Makefile
           menus/Makefile
           packages/Makefile
           packages/rpm/gebr-menus-package.fedora.spec
           packages/rpm/gebr-menus-package.opensuse.spec
           packages/rpm/gebr-menus-package.mandriva.spec )

