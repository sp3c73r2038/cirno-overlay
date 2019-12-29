# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="C client interface to Zookeeper server"
HOMEPAGE="https://zookeeper.apache.org/"
SRC_URI="mirror://apache/zookeeper/zookeeper-${PV}/apache-zookeeper-${PV}.tar.gz"

inherit autotools-utils flag-o-matic

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc static-libs test"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	test? ( dev-util/cppunit )"

S="${WORKDIR}/apache-zookeeper-${PV}/zookeeper-client/zookeeper-client-c"

src_prepare() {
	default
	eautoreconf
	autotools-utils_src_prepare
}

src_configure() {
	append-cflags -Wno-error=format-overflow
	local myeconfargs=(
		$(use_enable static-libs static) \
		$(use_with test cppunit)
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
}

src_install() {
	autotools-utils_src_install
	use doc && dohtml docs/html/*
}
