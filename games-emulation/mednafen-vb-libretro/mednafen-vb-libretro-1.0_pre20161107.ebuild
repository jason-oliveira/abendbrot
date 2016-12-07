# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro-core

DESCRIPTION="libretro implementation of Mednafen VB. (Virtual Boy)"
HOMEPAGE="https://github.com/libretro/beetle-vb-libretro"
SRC_URI="https://github.com/libretro/beetle-vb-libretro/archive/c99ba93ff1e1024b3034fb9e069864b2b93a0bda.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/beetle-vb-libretro-c99ba93ff1e1024b3034fb9e069864b2b93a0bda"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/libretro/beetle-vb-libretro.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

LIBRETRO_CORE_NAME=mednafen_vb

src_compile() {
	filter-flags -O*
	emake $(usex debug "DEBUG=1" "") core=vb || die "emake failed"
}