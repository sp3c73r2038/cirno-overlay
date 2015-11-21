EAPI="5"
CMAKE_MIN_VERSION="2.6"
inherit git-2 eutils

DESCRIPTION="multiple mon management tool"
HOMEPAGE="https://github.com/aleiphoenix/monctl"
EGIT_REPO_URI="git://cgit.momoka.net/monctl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	sys-process/mon
"

src_prepare() {
	epatch_user
}

src_install() {
	dobin monctl
	newinitd "${FILESDIR}"/monctl.initd monctl
	dodir /etc/monctl
	dodir /etc/monctl/apps.d
	dodir /var/log/monctl
	dodir /var/lib/monctl
	insinto /etc/monctl
	doins "${FILESDIR}"/monctl.conf
}
