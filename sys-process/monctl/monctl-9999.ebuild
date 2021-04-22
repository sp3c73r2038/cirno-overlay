EAPI="5"
inherit git-r3 eutils

DESCRIPTION="multiple mon management tool"
HOMEPAGE="https://github.com/aleiphoenix/monctl"
EGIT_REPO_URI="git://git.momoka.net/monctl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	sys-process/mon
	sys-process/dolly
"

src_prepare() {
	sed -i -e 's;/local;;g' config.def.h
	epatch_user
}

src_compile() {
	emake
}

src_install() {
	dobin monctl
	newinitd "${FILESDIR}"/monctl.initd monctl
	dodir /etc/monctl
	dodir /etc/monctl/apps.d
	dodir /var/log/monctl
	dodir /var/lib/monctl
	fperms 1777 /var/log/monctl
	fperms 1777 /var/lib/monctl
	insinto /etc/monctl
	doins "${FILESDIR}"/monctl.conf
}
