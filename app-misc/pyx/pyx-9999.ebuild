EAPI="7"
inherit git-r3 eutils

DESCRITION="make your virtualenv better"
HOMEPAGE="https://github.com/aleiphoenix/pyx"
EGIT_REPO_URI="http://git.momoka.net/python/pyx"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_install() {
	dobin pyx
}
