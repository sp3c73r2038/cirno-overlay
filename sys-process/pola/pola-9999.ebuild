EAPI="6"
inherit git-r3 eutils

DESCRIPTION="process keeper"
HOMEPAGE="https://github.com/aleiphoenix/pola"
EGIT_REPO_URI="git://git.momoka.net/pola.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/json-c"

src_prepare() {
	epatch_user
}

src_compile() {
	emake
}

src_install() {
	dobin pola
	newinitd "${FILESDIR}"/pola.initd pola
	keepdir /etc/pola
	keepdir /etc/pola/apps.d
	keepdir /var/log/pola
	keepdir /var/lib/pola
	insinto /etc/pola
	doins "${FILESDIR}"/pola.conf
}
