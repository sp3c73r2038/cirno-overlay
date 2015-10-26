EAPI=5

PYTHON_COMPAT=( python2_7 )

AUTOTOOLS_AUTORECONF=true

inherit python-single-r1

DESCRIPTION="A simple and easy-to-use C language RPC framework based on GObject System"
HOMEPAGE="https://github.com/haiwen/libsearpc"
SRC_URI="https://github.com/haiwen/libsearpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-libs/glib-2.26.0
	>=dev-libs/jansson-2.2.1
	${PYTHON_DEPS}
"

RWQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	./autogen.sh
}

src_configure() {
	econf PYTHON="${EPYTHON}"
}
