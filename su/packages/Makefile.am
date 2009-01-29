# GÍBR Menus SU - Seismic Unix menus for GÍBR
# Copyright (C) 2008 GÍBR Core Team
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

EXTRA_DIST =
	rpm/gebr.fedora.spec \
	rpm/gebr.opensuse.spec \
	rpm/gebr.mandriva.spec

packages: deb-package rpm-packages
rpm-packages: fedora-package opensuse-package mandriva-package

deb-package:
	cd ..;dpkg-buildpackage -kA594D681 -tc -rfakeroot; cd -

rpm-structure:
	cd ..; make dist; cd -
	mkdir -p rpm/BUILD rpm/RPMS rpm/SRPMS rpm/SOURCES && cp ../@PACKAGE@-@VERSION@.tar.gz rpm/SOURCES

fedora-package: rpm-structure
	rpmbuild -ba rpm/gebr-menus-su.fedora.spec

opensuse-package: rpm-structure
	rpmbuild -ba rpm/gebr-menus-su.opensuse.spec

mandriva-package: rpm-structure
	rpmbuild -ba rpm/gebr-menus-su.mandriva.spec
