EAPI="5"
inherit git-2 eutils

DESCRIPTION=""
HOMEPAGE="https://github.com/aleiphoenix/dolly"
EGIT_REPO_URI="git://git.momoka.net/dolly.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -i -e 's;/local;;g' config.def.h
	epatch_user
}

src_compile() {
	emake
}

src_install() {
	dobin dolly
}
