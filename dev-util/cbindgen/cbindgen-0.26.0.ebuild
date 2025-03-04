# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.10

EAPI=8

CRATES="atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	cfg-if@1.0.0
	clap@3.2.25
	clap_lex@0.2.4
	fastrand@1.9.0
	hashbrown@0.12.3
	heck@0.4.1
	hermit-abi@0.1.19
	indexmap@1.9.3
	instant@0.1.12
	itoa@1.0.6
	lazy_static@1.4.0
	libc@0.2.144
	lock_api@0.4.9
	log@0.4.17
	os_str_bytes@6.5.0
	parking_lot@0.11.2
	parking_lot_core@0.8.6
	proc-macro2@1.0.66
	quote@1.0.27
	redox_syscall@0.2.16
	remove_dir_all@0.5.3
	ryu@1.0.13
	scopeguard@1.1.0
	serde@1.0.163
	serde_derive@1.0.163
	serde_json@1.0.96
	serial_test@0.5.1
	serial_test_derive@0.5.1
	smallvec@1.10.0
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.16
	tempfile@3.3.0
	termcolor@1.2.0
	textwrap@0.16.0
	toml@0.5.11
	unicode-ident@1.0.8
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9"

inherit cargo

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com/mozilla/cbindgen/"
SRC_URI="${CARGO_CRATE_URIS}
	https://github.com/mozilla/cbindgen/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
# Dependent crate licenses
LICENSE+="
	BSD MIT Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~ppc64 ~riscv ~x86"

RESTRICT="test"
QA_FLAGS_IGNORED="usr/bin/cbindgen"
