EAPI="5"
CMAKE_MIN_VERSION="2.6"
inherit cmake-utils git-2

DESCRIPTION="multiple mon management tool"
HOMEPAGE="https://github.com/aleiphoenix/monctl"
EGIT_REPO_URI="git://cgit.momoka.net/qianka/monctl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
	mycmakeargs=(
		-DPREFIX="${EPREFIX}/usr"
	)

	cmake-utils_src_configure
}


src_compile() {
	cmake-utils_src_make
}


src_install() {
	cmake-utils_src_install
}
