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

SUBDIRS =

EXTRA_DIST = \
	     rpm/gebr-menus.spec.in             \
	     rpm/gebr-menus-su.fedora.spec.in   \
	     rpm/gebr-menus-su.mandriva.spec.in \
	     rpm/gebr-menus-su.opensuse.spec.in \
             debian/changelog       \
             debian/compat          \
             debian/control         \
             debian/copyright       \
             debian/dirs            \
             debian/docs            \
             debian/install         \
             debian/postinst.ex     \
             debian/postrm.ex       \
             debian/preinst.ex      \
             debian/prerm.ex        \
             debian/rules

packages: deb-package rpm-packages
rpm-packages: fedora-package opensuse-package mandriva-package

deb-package:
	cd ..; dpkg-buildpackage -kA594D681 -tc -rfakeroot; cd -

rpm-structure:
	cd ..; make dist; cd -
	mkdir -p rpm/BUILD rpm/RPMS rpm/SRPMS rpm/SOURCES && cp ../@PACKAGE@-@VERSION@.tar.gz rpm/SOURCES

fedora-package: rpm-structure
	rpmbuild -ba rpm/gebr-menus-su.fedora.spec

opensuse-package: rpm-structure
	rpmbuild -ba rpm/gebr-menus-su.opensuse.spec

mandriva-package: rpm-structure
	rpmbuild -ba rpm/gebr-menus-su.mandriva.spec

# packages: deb-package rpm-package
# 
# deb-package:
# 	cd ..; dpkg-buildpackage -kA594D681 -tc -rfakeroot; cd -
# 
# rpm-package:
# 	cd ..; make dist; cd -
# 	mkdir -p rpm/BUILD rpm/RPMS rpm/SRPMS rpm/SOURCES 
# 	cp ../@PACKAGE@-@VERSION@.tar.gz rpm/SOURCES
# 	rpmbuild -ba rpm/gebr-menus.spec

