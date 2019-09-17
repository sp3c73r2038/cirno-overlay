EAPI="5"
inherit eutils

DESCRIPTION="kubelet initd script"
HOMEPAGE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_unpack() {
	mkdir "${S}"
}

src_install() {
	newconfd "${FILESDIR}"/kubelet.confd kubelet
	newinitd "${FILESDIR}"/kubelet.initd kubelet
	keepdir /var/log/kubelet
}
