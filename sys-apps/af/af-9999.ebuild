EAPI="5"

inherit git-2 eutils

DESCRIPTION="ag is really slow"
HOMEPAGE="https://github.com/lucy/af"
EGIT_REPO_URI="git://github.com/lucy/af.git"

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
