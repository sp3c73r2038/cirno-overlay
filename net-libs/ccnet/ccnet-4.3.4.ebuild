EAPI=5

DESCRIPTION="Ccnet is a framework for writing networked applications in C."
HOMEPAGE="https://github.com/haiwen/ccnet/tree/v4.3.4"
SRC_URI="https://github.com/haiwen/ccnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.8
	>=net-libs/libsearpc-3.0.4
	virtual/mysql
	>=dev-db/libzdb-2.10.2[mysql]
"


src_prepare() {
	./autogen.sh
}

src_configure() {
	local myconf="--enable-server"
	econf $myconf
}
