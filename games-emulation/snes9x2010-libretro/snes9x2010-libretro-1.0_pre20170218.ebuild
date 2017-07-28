# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/${PN//-libretro}"
LIBRETRO_COMMIT_SHA="b2a69de0df1eb39ed362806f9c9633f4544272af"
inherit libretro-core

DESCRIPTION="Snes9x 2010. Port of Snes9x 1.52+ to Libretro (previously called SNES9x Next)"
HOMEPAGE="https://github.com/libretro/snes9x2010"
KEYWORDS="amd64 x86"

LICENSE="snes9x"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

src_install() {
	insinto "${LIBRETRO_DATA_DIR}"/snes9x2010_libretro
	doins "${S}"/docs/snes9x-license.txt
	libretro-core_src_install
}
