EAPI=5

AUTOTOOLS_AUTORECONF=true

inherit git-r3 linux-info linux-mod

DESCRIPTION="stand-alone RTL8188EU driver."
HOMEPAGE="https://github.com/lwfinger/rtl8188eu"
EGIT_REPO_URI="git://github.com/lwfinger/rtl8188eu"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

DOCS=( )

CONFIG_CHECK="WIRELESS_EXT WEXT_PRIV CRYPTO"

src_prepare() {
	KSRC="${KV_OUT_DIR}"
	ARCH="$(uname -m | sed -e s/i.86/i386/ | sed -e s/ppc/powerpc/ | sed -e s/armv.l/arm/)"
}

src_compile() {
	emake
}

src_install() {
	insinto /lib/modules/${KV_FULL}/kernel/drivers/net/wireless
	insopts -p -D -m644
	doins 8188eu.ko
	dodir /lib/firmware/rtlwifi
	insinto /lib/firmware/rtlwifi
	doins rtl8188eufw.bin
}
