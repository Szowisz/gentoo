# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RESTRICT="test" # fails with sandbox

CRATES="
	aho-corasick@1.1.2
	anes@0.1.6
	anstyle@1.0.4
	anyhow@1.0.75
	argv@0.1.9
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.1
	bstr@1.7.0
	caps@0.5.5
	cast@0.3.0
	cfg-if@1.0.0
	ciborium-io@0.2.1
	ciborium-ll@0.2.1
	ciborium@0.2.1
	clap@4.4.6
	clap_builder@4.4.6
	clap_lex@0.5.1
	criterion-plot@0.5.0
	criterion@0.5.1
	either@1.9.0
	env_logger@0.10.0
	errno@0.3.5
	fnv@1.0.7
	getargs@0.5.0
	globset@0.4.13
	half@1.8.2
	heck@0.4.1
	hermit-abi@0.3.3
	io-uring@0.6.2
	ipnetwork@0.20.0
	is-terminal@0.4.9
	itertools@0.10.5
	itoa@1.0.9
	lazy_static@1.4.0
	libc@0.2.149
	libseccomp-sys@0.2.1
	libseccomp@0.3.0
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.10
	lock_api@0.4.10
	log@0.4.20
	memchr@2.6.4
	memoffset@0.7.1
	nix@0.26.4
	nonempty@0.8.1
	num-traits@0.2.17
	num_cpus@1.16.0
	once_cell@1.18.0
	oorandom@11.1.3
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	pkg-config@0.3.27
	proc-macro2@1.0.69
	quote@1.0.33
	redox_syscall@0.3.5
	regex-automata@0.4.3
	regex-syntax@0.8.2
	regex@1.10.2
	rustix@0.38.20
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.189
	serde_derive@1.0.189
	serde_json@1.0.107
	smallvec@1.11.1
	strum@0.25.0
	strum_macros@0.25.3
	syn@2.0.38
	thiserror-impl@1.0.50
	thiserror@1.0.50
	threadpool@1.8.1
	tinytemplate@1.2.1
	ttl_cache@0.5.1
	unicode-ident@1.0.12
	walkdir@2.4.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
"

inherit cargo

DESCRIPTION="practical userspace application sandbox"
HOMEPAGE="https://gitlab.exherbo.org/sydbox"

SRC_URI="https://git.sr.ht/~alip/syd/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

IUSE="+static"

LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+=" Apache-2.0 MIT Unicode-DFS-2016"

SLOT="0"
KEYWORDS="~amd64"

DEPEND="static? ( sys-libs/libseccomp[static-libs] )
	sys-libs/libseccomp"
RDEPEND="${DEPEND}"

S="${WORKDIR}/syd-v${PV}"

src_compile() {
	if use static; then
		export LIBSECCOMP_LINK_TYPE="static"
		export LIBSECCOMP_LIB_PATH=$(pkgconf --variable=libdir libseccomp)
		export RUSTFLAGS+="-Clink-args=-static -Clink-args=-no-pie -Clink-args=-Wl,-Bstatic -Ctarget-feature=+crt-static"
		myfeatures=( "static" )
	fi
	cargo_src_compile
}

src_install () {
	cargo_src_install
	dodoc README.md
	insinto /usr/libexec
	doins data/esyd.sh
}
