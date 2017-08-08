# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/${PN/mednafen-saturn/beetle-saturn}"
LIBRETRO_COMMIT_SHA="f77b4a002c49f5ade68137ac10dd8eed8792519a"
inherit libretro-core

DESCRIPTION="Standalone port of Mednafen Saturn to the libretro"
HOMEPAGE="https://github.com/libretro/beetle-saturn-libretro"
KEYWORDS="amd64 x86"

LICENSE="GPL-2"
SLOT="0"
IUSE="opengl"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_setup() {
	! use opengl && LIBRETRO_CORE_NAME="mednafen_saturn"
	use opengl && LIBRETRO_CORE_NAME="mednafen_saturn_hw"
}

src_compile() {
	myemakeargs=(
		$(usex opengl "HAVE_OPENGL=1" "HAVE_OPENGL=0")
	)
	libretro-core_src_compile
}
