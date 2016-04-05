EAPI="5"
inherit git-2 eutils

DESCRIPTION="process keeper"
HOMEPAGE="https://github.com/aleiphoenix/pola"
EGIT_REPO_URI="git://git.momoka.net/pola.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""

src_prepare() {
	epatch_user
}

src_compile() {
	emake
}

src_install() {
	dobin pola
	newinitd "${FILESDIR}"/pola.initd pola
	dodir /etc/pola
	dodir /etc/pola/apps.d
	dodir /var/log/pola
	dodir /var/lib/pola
	insinto /etc/pola
	doins "${FILESDIR}"/pola.conf
}
