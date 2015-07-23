EAPI=5

inherit git-2

DESCRIPTION="Monitor a group of processes with mon"
HOMEPAGE="https://github.com/jgallen23/mongroup"
SLOT="0"
LICENSE="MIT"
EGIT_REPO_URI="git://cgit.momoka.net/mongroup.git"

KEYWORDS="~amd64 ~x86"

RDEPEND="
	sys-process/mon
"

src_install() {
	dobin mongroup

	dodir /etc/mongroup
	dodir /var/log/mongroup/
	dodir /var/lib/mongroup/

	insinto /etc/mongroup
	doins mongroup.conf

	newinitd "${FILESDIR}"/mongroup.initd mongroup
}
