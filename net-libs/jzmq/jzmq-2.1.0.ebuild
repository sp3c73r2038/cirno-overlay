# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/zeromq/zeromq-4.0.4-r1.ebuild,v 1.1 2014/06/18 08:21:16 qnikst Exp $

EAPI=5

AUTOTOOLS_AUTORECONF=true

# inherit autotools-utils

DESCRIPTION="Java binding for ØMQ"
HOMEPAGE="https://github.com/zeromq/jzmq"
SRC_URI="https://github.com/zeromq/jzmq/archive/v${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="net-libs/zeromq"
DEPEND="${RDEPEND}"

src_prepare() {
	./autogen.sh
}

src_compile() {
	emake -j1
}
