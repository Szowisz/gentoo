# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999

CABAL_HACKAGE_REVISION=1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A family of combinators for defining webservices APIs"
HOMEPAGE="https://docs.servant.dev/"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-haskell/aeson-1.4.1.0:=[profile?] <dev-haskell/aeson-3:=[profile?]
	>=dev-haskell/attoparsec-0.13.2.2:=[profile?] <dev-haskell/attoparsec-0.15:=[profile?]
	>=dev-haskell/base-compat-0.10.5:=[profile?] <dev-haskell/base-compat-0.14:=[profile?]
	>=dev-haskell/bifunctors-5.5.3:=[profile?] <dev-haskell/bifunctors-5.7:=[profile?]
	>=dev-haskell/case-insensitive-1.2.0.11:=[profile?] <dev-haskell/case-insensitive-1.3:=[profile?]
	>=dev-haskell/constraints-0.2:=[profile?]
	>=dev-haskell/http-api-data-0.4.1:=[profile?] <dev-haskell/http-api-data-0.6:=[profile?]
	>=dev-haskell/http-media-0.7.1.3:=[profile?] <dev-haskell/http-media-0.9:=[profile?]
	>=dev-haskell/http-types-0.12.2:=[profile?] <dev-haskell/http-types-0.13:=[profile?]
	>=dev-haskell/mmorph-1.1.2:=[profile?] <dev-haskell/mmorph-1.3:=[profile?]
	>=dev-haskell/network-uri-2.6.1.0:=[profile?] <dev-haskell/network-uri-2.7:=[profile?]
	>=dev-haskell/quickcheck-2.12.6.1:2=[profile?] <dev-haskell/quickcheck-2.15:2=[profile?]
	>=dev-haskell/singleton-bool-0.1.4:=[profile?] <dev-haskell/singleton-bool-0.2:=[profile?]
	>=dev-haskell/sop-core-0.4.0.0:=[profile?] <dev-haskell/sop-core-0.6:=[profile?]
	>=dev-haskell/string-conversions-0.4.0.1:=[profile?] <dev-haskell/string-conversions-0.5:=[profile?]
	>=dev-haskell/tagged-0.8.6:=[profile?] <dev-haskell/tagged-0.9:=[profile?]
	>=dev-haskell/text-1.2.3.0:=[profile?] <dev-haskell/text-2.1:=[profile?]
	>=dev-haskell/vault-0.3.1.2:=[profile?] <dev-haskell/vault-0.4:=[profile?]
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
	test? ( >=dev-haskell/hspec-2.6.0 <dev-haskell/hspec-2.12
		>=dev-haskell/quickcheck-instances-0.3.19 <dev-haskell/quickcheck-instances-0.4 )
"
