EAPI="5"

inherit git-2 eutils

DOCS=( LICENSE README FAQ )

DESCRIPTION="st is a simple terminal implementation for X."
HOMEPAGE="http://st.suckless.org/"
EGIT_REPO_URI="http://git.suckless.org/st"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}"/st-git-20151018-argbbg.patch
	epatch "${FILESDIR}"/st-git-20151122-scrollback.patch
	epatch "${FILESDIR}"/st-git-20151106-scrollback-mouse.patch
	epatch_user

	cp "${FILESDIR}"/config.h "${S}"/
}

src_install() {
	mkdir -p "${D}"/usr/share/terminfo
	tic -o "${D}"/usr/share/terminfo/ st.info
	dobin st
	doman st.1
}
