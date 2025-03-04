# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="The MAD id3tag library, Tenacity fork"
HOMEPAGE="https://codeberg.org/tenacityteam/libid3tag"
SRC_URI="https://codeberg.org/tenacityteam/libid3tag/archive/${PV}.tar.gz -> ${P}.codeberg.tar.gz"
S="${WORKDIR}/${PN}"

LICENSE="GPL-2"
SLOT="0/${PV}" # SOVERSION = ${CMAKE_PROJECT_VERSION} in CMakeLists.txt
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~loong ~m68k ~mips ppc ~ppc64 ~riscv ~s390 sparc x86"

RDEPEND="sys-libs/zlib[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
