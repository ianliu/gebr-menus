#!/bin/bash

#   Copyright 2010-2012 Ricardo Biloti <biloti@gebproject.com>

#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

function usage ()
{
CWPROOT=/usr/local/stow/su-"$SU_VERSION"

echo "SU install made easy - A cortesy of GeBR Project
Syntax: $0 [options]

Options:
    -h,-? : show this help
       -V : SU version ($SU_VERSION)
       -p : SU version prefix ($SU_VERSION_PREFIX)
       -a : SU archive ($SU_ARCHIVE)
       -d : CWP FTP URL ($CWP_SRC_URL)
       -o : Download path ($DOWNLOAD_PATH)
       -u : Uninstall SU ($UNINSTALL)
       -U : Keep previously installed SU ($KEEP_OLDER_SUS)
       -t : Text mode (do not use graphical client to ask
            for passwords)

SU install path: $CWPROOT

This scripts is designed to Ubuntu/Debian Linux systems.
Debian users however should have administration privileges
through sudo utility.

New version of this script will be released
through Download area of GeBR Project site.

Any problem with this script, please report to
Ricardo Biloti <biloti@gebrproject.com>

2009-2012 (c) Ricardo Biloti - GeBR Project
http://www.gebrproject.com/
"
}

function check_pkg {

    dpkg -l $1 | grep ^ii > /dev/null 2>&1
    if [ $? -eq 1 ]; then
	echo "missing. Scheduling it for installing"
	PKGS_TO_INSTALL="$PKGS_TO_INSTALL $1"
    else
	echo "present"
    fi
}

# Default values
#------------------------------------------------------------------------------#

SU_VERSION="43R2"
SU_VERSION_PREFIX="43"
SU_ARCHIVE="cwp_su_all_$SU_VERSION.tgz"
DOWNLOAD_PATH="$HOME/Downloads"
CWP_SRC_URL="ftp://ftp.cwp.mines.edu/pub/cwpcodes"
UNINSTALL="FALSE"
KEEP_OLDER_SUS="FALSE"
TEXT_MODE="FALSE"

# Parsing command line parameters
#------------------------------------------------------------------------------#

while getopts "V:p:a:o:d:uUth" OPT; do
  case $OPT in
      "h") usage; exit 0               ;;
      "?") usage; exit 0               ;;
      "V") SU_VERSION="$OPTARG";SU_ARCHIVE="cwp_su_all_$SU_VERSION.tgz"  ;;
      "p") SU_VERSION_PREFIX="$OPTARG" ;;
      "a") SU_ARCHIVE="$OPTARG"        ;;
      "o") DOWNLOAD_PATH="$OPTARG"     ;;
      "d") CWP_SRC_URL="$OPTARG"       ;;
      "u") UNINSTALL="TRUE"            ;;
      "U") KEEP_OLDER_SUS="TRUE"       ;;
      "t") TEXT_MODE="TRUE"            ;;
  esac
done

CWPROOT=/usr/local/stow/su-"$SU_VERSION"

# Setup SUDO mode (text/graphic)
export SUDO_ASKPASS=${SUDO_ASKPASS:-"/usr/lib/openssh/gnome-ssh-askpass"}
if [ "$TEXT_MODE" == "FALSE" ]; then
    if [ ! -f $SUDO_ASKPASS ]; then
	echo "You do not have a graphical client to ask for passwords."
	echo "Sorry, but this is not going to work through GêBR."
	echo "You still have the option to run this script through"
	echo "a shell terminal. Use the option -t."
	exit 1;
    fi
    SUDO="sudo -A"
else
    SUDO="sudo"
fi

cat <<EOF
SU install made easy - A cortesy of GeBR Project

Try "$0 -h" to see the usage guide.
EOF

# Uninstall SU and exits
if [ "$UNINSTALL" == 'TRUE' ]; then
    if [ -d "$CWPROOT" ]; then
    	cd /usr/local/stow
	echo "Uninstalling SU $SU_VERSION"
	$SUDO stow -D su-$SU_VERSION
    else
	echo "Nothing to uninstall"
    fi
    exit 0;
fi

if [ ! -d "$DOWNLOAD_PATH" ]; then
    mkdir -p "$DOWNLOAD_PATH"
fi

cd "$DOWNLOAD_PATH"
echo "SU $SU_VERSION archive.............. Downloading it now"
wget -qc "$CWP_SRC_URL/$SU_ARCHIVE"

echo "Testing for required packages"

PKGS_TO_INSTALL=""

echo -n "gcc........................ "
check_pkg gcc

echo -n "gfortran................... "
check_pkg gfortran

echo -n "stow....................... "
check_pkg stow

echo -n "lesstif.................... "
check_pkg lesstif2-dev

echo -n "GLUT....................... "
check_pkg freeglut3-dev

echo -n "Xmu........................ "
check_pkg libxmu-dev

if [ "$PKGS_TO_INSTALL"'x' != 'x' ]; then
    echo "Installing missing packages"
    $SUDO apt-get install $PKGS_TO_INSTALL
fi

if [ ! -d "$CWPROOT" ]; then 
    $SUDO mkdir -p "$CWPROOT"
fi

cd "$CWPROOT"
echo "Extracting SU source files..."
$SUDO tar zxf "$DOWNLOAD_PATH/$SU_ARCHIVE"

cat > /tmp/Makefile.config <<EOF
CWPROOT = $CWPROOT
include \$(CWPROOT)/src/Rules/gnumake.rules
include \$(CWPROOT)/src/Rules/abbrev.rules
include \$(CWPROOT)/src/Rules/cflags.rules
include \$(CWPROOT)/src/Rules/suffix.rules
include \$(CWPROOT)/src/Rules/misc.rules
include \$(CWPROOT)/src/Rules/opengl.rules
LINEHDRFLAG = 
ENDIANFLAG = -DCWP_LITTLE_ENDIAN
LARGE_FILE_FLAG = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
CWP_FLAGS = \$(LARGE_FILE_FLAG) \$(ENDIANFLAG) \$(XDRFLAG) \$(LINEHDRFLAG)
SHELL = /bin/sh
ROOT = \$(CWPROOT)
LN = ln
AR = ar
ARFLAGS = rv
RANLIB = ranlib
RANFLAGS = 
ICHMODLINE = chmod 644 \$@
MCHMODLINE = chmod 755 \$@
IX11 = /usr/X11/include
LX11 = /usr/X11/lib
IMOTIF = /usr/X11R6/include
LMOTIF = /usr/X11R6/lib
LD_LIBRARY_PATH += \$(CWPROOT)/lib:\${LX11}:\${LMOTIF}
CPP = cpp
CC = gcc
OPTC = -g  -std=c99 -Wall -pedantic -Wno-long-long 
CFLAGS = -I\$I \$(OPTC) \$(CWP_FLAGS) -D_BSD_SOURCE -D_POSIX_SOURCE
FC = gfortran
FOPTS = -g 
FFLAGS = \$(FOPTS) -ffixed-line-length-none
C++FLAGS = -I\$I \$(OPTC) \$(CWP_FLAGS)SHELL = /bin/sh
EOF

cd src
if [ ! -e Makefile.config-original ]; then
    $SUDO mv Makefile.config Makefile.config-original
fi
$SUDO mv /tmp/Makefile.config .

$SUDO touch LICENSE_"$SU_VERSION_PREFIX"_ACCEPTED
$SUDO touch LICENSE_"$SU_VERSION"_ACCEPTED
$SUDO touch MAILHOME_"$SU_VERSION_PREFIX"
$SUDO touch MAILHOME_"$SU_VERSION"

if [ ! -e chkroot.sh-original ]; then
   $SUDO cp chkroot.sh chkroot.sh-original
fi
cat chkroot.sh-original | sed 's/read RESP/RESP="y"/' > /tmp/chkroot.sh
chmod 755 /tmp/chkroot.sh
$SUDO mv /tmp/chkroot.sh .

echo "Compiling SU package"

for target in install xtinstall finstall \
    mglinstall utils xminstall sfinstall; do
    $SUDO CWPROOT="$CWPROOT" make $target
done

echo -e "\nCompilation done."

cd /usr/local/stow
# Seach for installed older versions of SU
OLDER_SUS=`find . -name su-\* | grep -v "$SU_VERSION" | sed 's/^\..//' `
if [ `echo $OLDER_SUS | wc -l` -gt 0 ]; then
    echo it seems that this versions of SU are installed:
    echo -e $OLDER_SUS "\n"
    if [ "$KEEP_OLDER_SUS" == 'FALSE' ]; then
	echo "$OLDER_SUS" | while read oldsu; do
	    echo -n "Removing $oldsu from system path (it will "
	    echo not be purged from the system however\).
	    $SUDO stow -D $oldsu
	done
    else
	echo Unless you remove older versions of SU from path,
	echo they may conflict with the newer version your are trying
	echo to install.
	echo -e "\nIt is safe to set -U\n"
	echo This will only remove such older versions from path,
	echo without purging their files.
	exit -1
    fi
fi

$SUDO stow -D su-$SU_VERSION
$SUDO stow -v su-$SU_VERSION

cp /etc/profile /tmp
echo "export CWPROOT=$CWPROOT" >> /tmp/profile
$SUDO cp /tmp/profile /etc

echo "Installation done."
echo -e "SU will be available next time you log in.\n"
echo "Any problem with this script, please report to"
echo "Ricardo Biloti <biloti@gebrproject.com>"
