EAPI="5"

inherit eutils

DESCRIPTION="C hash ring library"
HOMEPAGE="https://github.com/chrismoos/hash-ring"
SRC_URI="https://github.com/chrismoos/hash-ring/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/hash-ring-${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""

src_prepare() {
	sed -i '/^LDFLAGS =/ c\LDFLAGS = -Wl,-soname,libhashring.so' Makefile
	epatch_user
}

src_compile() {
	emake
}

src_install() {
	dolib.so build/libhashring.so
}
