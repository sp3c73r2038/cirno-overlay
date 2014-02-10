# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2

DESCRIPTION="luna programming language - a small, elegant VM implemented in C"
HOMEPAGE="https://github.com/luna/luna"
EGIT_REPO_URI="https://github.com/luna/luna"

LICENSE="MIT"
SLOT="0"

KEYWORDS="~amd64 ~x86"

DEPEND="
  sys-devel/llvm
"

src_prepare() {
	sed -i '14 i\
LDFLAGS += -lm' Makefile
}

src_install() {
	dobin luna
}
