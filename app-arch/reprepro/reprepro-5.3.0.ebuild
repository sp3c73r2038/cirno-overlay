EAPI=5

SRC_URI="https://salsa.debian.org/brlink/reprepro/-/archive/${P}/${PN}-${P}.tar.gz"

DESCRIPTION="deb mirror tool"
HOMEPAGE="https://salsa.debian.org/brlink/reprepro"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
S="${WORKDIR}/${PN}-${P}"

inherit autotools bash-completion-r1

src_prepare () {
	mkdir -p "${S}/ac"
	eaclocal
	eautoheader
	eautomake
	eautoconf
	rm -rf autom4te.cache
}

src_install () {
	dobin changestool
	dobin reprepro
	dobin rredtool
	doman docs/changestool.1
	doman docs/reprepro.1
	doman docs/rredtool.1
	newbashcomp docs/reprepro.bash_completion ${PN}
}
