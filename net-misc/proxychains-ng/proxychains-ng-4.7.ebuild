# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit vcs-snapshot toolchain-funcs eutils multilib

DESCRIPTION="a preloader which hooks calls to sockets in dynamically linked programs and redirects it through one or more socks/http proxies."
HOMEPAGE="http://proxychains.sourceforge.net/ https://github.com/rofl0r/proxychains-ng"
SRC_URI="https://github.com/rofl0r/proxychains-ng/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE=""

RDEPEND="!net-misc/proxychains"

src_unpack() {
    unpack ${A}
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-makefile.patch
	sed -i "s/^\(LDSO_SUFFIX\).*/\1 = so.${PV}/" Makefile || die
	tc-export CC
}

src_configure() {
	./configure || die
}

src_install() {
	dobin proxychains
	dodoc AUTHORS ChangeLog README TODO

	dolib.so libproxychains.so.${PV}
	dosym libproxychains.so.${PV} /usr/$(get_libdir)/libproxychains.so.${PV:0:1}
	dosym libproxychains.so.${PV} /usr/$(get_libdir)/libproxychains.so

	insinto /etc
	doins src/proxychains.conf
}

