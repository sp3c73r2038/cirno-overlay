# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 multilib

DESCRIPTION="A set of pure Lua libraries."
HOMEPAGE="https://github.com/stevedonovan/Penlight"
EGIT_REPO_URI="https://github.com/stevedonovan/Penlight"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~arm-linux ~x86-linux"
IUSE=""

DEPEND="
  >=dev-lang/lua-5.1
"
RDEPEND="${DEPEND}"

src_install () {
	insinto /usr/$(get_libdir)/lua/5.1/pl
	doins lua/pl/*
}
