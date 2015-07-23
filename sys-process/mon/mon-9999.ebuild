EAPI=5

inherit git-2

DESCRIPTION="Simple single-process process monitoring program written in C "
HOMEPAGE="https://github.com/tj/mon"
EGIT_REPO_URI="git://github.com/tj/mon"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	dobin mon
}
