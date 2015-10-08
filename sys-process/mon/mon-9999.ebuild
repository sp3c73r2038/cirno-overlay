EAPI=5

inherit git-2

DESCRIPTION="Simple single-process process monitoring program written in C "
HOMEPAGE="https://github.com/aleiphoenix/mon"
EGIT_REPO_URI="git://github.com/aleiphoenix/mon"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	dobin mon
}
