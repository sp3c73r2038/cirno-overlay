EAPI="5"
DESCRIPTION="Ultralightweight JSON parser in ANSI C"
HOMEPAGE="https://github.com/DaveGamble/cJSON"
SRC_URI="https://github.com/DaveGamble/cJSON/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/cJSON-${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""


inherit eutils

src_prepare() {
	epatch_user
}

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install-cjson
}
