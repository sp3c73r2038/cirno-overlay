EAPI="5"

inherit git-2 eutils

DESCRIPTION="ag is really slow"
HOMEPAGE=""
EGIT_REPO_URI="git://git.hachune.pl/af.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libpcre[jit]
"

src_prepare() {
	cp "${FILESDIR}"/Makefile "${S}/"
	epatch_user
}

src_install() {
	dobin af
}
