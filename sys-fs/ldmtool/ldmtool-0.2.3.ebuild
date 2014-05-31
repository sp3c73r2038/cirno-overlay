EAPI=5

inherit vcs-snapshot eutils multilib

DESCRIPTION="a tool help to mount Windows Logical Disk Manager partitions."
HOMEPAGE="https://github.com/aleiphoenix/libldm"
SRC_URI="https://github.com/aleiphoenix/libldm/archive/libldm-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPENDS="
	dev-libs/json-glib
	dev-util/gtk-doc
"

src_unpack() {
    unpack ${A}
	mv ${WORKDIR}/libldm-libldm-${PV} ${WORKDIR}/${P}
}

src_prepare() {
	epatch "${FILESDIR}"/ldmtool-${PV}.patch
	tc-export CC
}

src_configure() {
	./autogen.sh || die
	./configure --prefix="/usr" || die
}

src_install() {
	make DESTDIR="${D}" install
}

