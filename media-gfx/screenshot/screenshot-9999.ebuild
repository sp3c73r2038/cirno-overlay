# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2

DESCRIPTION="A script using ImageMagick to take screenshots"
HOMEPAGE="https://github.com/aleiphoenix/screenshot"
EGIT_REPO_URI="git://github.com/aleiphoenix/screenshot"

LICENSE="WTFPL"
SLOT="0"

# just copied from imagemagick
KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc ~s390 ~sh ~x86 ~ppc-aix ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"

DEPEND="media-gfx/imagemagick"

src_install() {
	dobin screenshot
}

