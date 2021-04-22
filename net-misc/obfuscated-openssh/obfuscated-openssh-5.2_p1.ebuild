# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/openssh/openssh-6.6_p1-r1.ebuild,v 1.10 2014/03/23 09:54:17 ago Exp $

EAPI="5"

inherit autotools eutils git-r3

# Make it more portable between straight releases
# and _p? releases.
PARCH=${P/_}

DESCRIPTION="Handshake obfuscation version of OpenSSH"
HOMEPAGE="https://github.com/brl/obfuscated-openssh"
EGIT_REPO_URI="https://github.com/brl/obfuscated-openssh"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="bindist kerberos libedit pam tcpd X"

LIB_DEPEND="
	libedit? ( dev-libs/libedit )
	>=dev-libs/openssl-0.9.6d:0[bindist=]
	dev-libs/openssl
	>=sys-libs/zlib-1.2.3
	tcpd? ( >=sys-apps/tcp-wrappers-7.6 )"
RDEPEND="
	pam? ( virtual/pam )
	kerberos? ( virtual/krb5 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	virtual/os-headers
	sys-devel/autoconf"
RDEPEND="${RDEPEND}
	pam? ( >=sys-auth/pambase-20081028 )
	userland_GNU? ( virtual/shadow )
	X? ( x11-apps/xauth )"

S=${WORKDIR}/${PARCH}

src_prepare() {
	epatch "${FILESDIR}/0001-obfuscated.patch"
	sed -i \
		-e "/_PATH_XAUTH/s:/usr/X11R6/bin/xauth:${EPREFIX}/usr/bin/xauth:" \
		pathnames.h || die
	# don't break .ssh/authorized_keys2 for fun
	sed -i '/^AuthorizedKeysFile/s:^:#:' sshd_config || die

	tc-export PKG_CONFIG
	local sed_args=(
		-e "s:-lcrypto:$(${PKG_CONFIG} --libs openssl):"
		# Disable PATH reset, trust what portage gives us #254615
		-e 's:^PATH=/:#PATH=/:'
		# Disable fortify flags ... our gcc does this for us
		-e 's:-D_FORTIFY_SOURCE=2::'
	)
	sed -i "${sed_args[@]}" configure{.ac,} || die

	epatch_user #473004

	eautoreconf
}

src_configure() {
	local myconf
	addwrite /dev/ptmx

	econf \
		--with-ldflags="${LDFLAGS}" \
		--disable-strip \
		--with-pid-dir="${EPREFIX}"/var/run \
		--sysconfdir="${EPREFIX}"/etc/obfuscated-ssh \
		--libexecdir="${EPREFIX}"/usr/$(get_libdir)/misc \
		--datadir="${EPREFIX}"/usr/share/obfuscated-openssh \
		--with-privsep-path="${EPREFIX}"/var/empty \
		--with-privsep-user=sshd \
		--with-md5-passwords \
		--with-ssl-engine \
		$(static_use_with pam) \
		$(static_use_with kerberos kerberos5 /usr) \
		$(use_with libedit) \
		$(use_with tcpd tcp-wrappers) \
		${myconf}
}

src_install() {
	emake install-nokeys DESTDIR="${D}"
	fperms 600 /etc/obfuscated-ssh/sshd_config
	newbin contrib/ssh-copy-id obfuscated-ssh-copy-id
	newinitd "${FILESDIR}"/sshd.rc5.2 obfuscated-sshd
	newconfd "${FILESDIR}"/sshd.confd obfuscated-sshd
	keepdir /var/empty

	# not all openssl installs support ecc, or are functional #352645
	if ! grep -q '#define OPENSSL_HAS_ECC 1' config.h ; then
		elog "dev-libs/openssl was built with 'bindist' - disabling ecdsa support"
		sed -i 's:&& gen_key ecdsa::' "${ED}"/etc/init.d/obfuscated-sshd || die
	fi

	# Gentoo tweaks to default config files
	cat <<-EOF >> "${ED}"/etc/obfuscated-ssh/sshd_config

	# Allow client to pass locale environment variables #367017
	AcceptEnv LANG LC_*
	EOF
	cat <<-EOF >> "${ED}"/etc/obfuscated-ssh/ssh_config

	# Send locale environment variables #367017
	SendEnv LANG LC_*
	EOF

	newman contrib/ssh-copy-id.1 obfuscated-ssh-copy-id.1
	dodoc ChangeLog CREDITS OVERVIEW README* TODO sshd_config

	diropts -m 0700
	dodir /etc/skel/.ssh

}

pkg_preinst() {
	enewgroup sshd 22
	enewuser sshd 22 -1 /var/empty sshd
}

pkg_postinst() {
	ewarn "Remember to merge your config files in /etc/obfuscated-ssh/ and then"
	ewarn "reload sshd: '/etc/init.d/obfuscated-sshdreload'."
}
