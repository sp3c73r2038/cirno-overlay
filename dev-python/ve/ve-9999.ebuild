# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2

IUSE=""
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sh sparc x86 x86-fbsd x86-freebsd amd64-linux x86-linux"

DESCRIPTION="Run the command in context of the virtualenv."
HOMEPAGE="https://github.com/erning/ve"
EGIT_REPO_URI="git://github.com/erning/ve.git"

LICENSE=""
SLOT="0"

src_prepare() {
	rm Makefile
}

src_install() {
	dobin ve
}

