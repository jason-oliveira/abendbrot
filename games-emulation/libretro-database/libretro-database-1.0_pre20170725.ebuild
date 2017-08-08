# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_COMMIT_SHA="8030c7e449d8b7d4e001904138257b22b7b7a18d"
inherit libretro

DESCRIPTION="Repository containing cheatcode files, content data files, etc."
HOMEPAGE="https://github.com/libretro/libretro-database"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dodir "${LIBRETRO_DATA_DIR}"/cheats/
	cp -R "${S}"/cht/* "${D}${LIBRETRO_DATA_DIR}"/cheats/
	dodir "${LIBRETRO_DATA_DIR}"/data/
	cp -R "${S}"/dat/* "${D}${LIBRETRO_DATA_DIR}"/data/
	cp -R "${S}"/rdb/* "${D}${LIBRETRO_DATA_DIR}"/data/
}
