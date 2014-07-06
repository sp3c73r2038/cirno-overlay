EAPI=5

inherit eutils user

SRC_URI="http://downloads.opennebula.org/packages/${P}/${P}.tar.gz"

DESCRIPTION=""
HOMEPAGE="http://www.opennebula.org"
LICENSE=""
KEYWORDS="~amd64"
SLOT="0"
IUSE="mysql sqlite syslog ruby_targets_ruby19 xen"

RDEPEND="
	dev-ruby/sinatra[ruby_targets_ruby19]
	dev-ruby/json[ruby_targets_ruby19]
	>=dev-ruby/nokogiri-1.4.4[ruby_targets_ruby19]
	dev-ruby/curb[ruby_targets_ruby19]
	dev-ruby/xmlparser[ruby_targets_ruby19]
	app-emulation/libvirt[xen?]"
DEPEND="
	>=dev-util/scons-0.98
	>=dev-libs/xmlrpc-c-1.31[abyss,threads]
	>=dev-libs/libxml2-2.7
	>=dev-libs/openssl-0.9.8
	app-cdr/cdrtools
	mysql? ( >=dev-db/mysql-5.1 >=dev-ruby/mysql-ruby-2.9[ruby_targets_ruby19] )
	sqlite? ( >=dev-db/sqlite-3.6 >=dev-ruby/sqlite3-1.3[ruby_targets_ruby19] )
	syslog? ( >=dev-libs/log4cpp-1.0 )"

REQUIRED_USE="!mysql? ( sqlite ) !sqlite? ( mysql )"

OPENNEBULA_DESTDIR="/opt/${P}"

pkg_setup() {
	enewgroup oneadmin 333
	enewuser oneadmin 333 /bin/bash /var/lib/one oneadmin
}

src_configure() {
	epatch "${FILESDIR}/${P}-0001-command-python.patch"
	epatch "${FILESDIR}/${P}-0002-command-ruby.patch"
}

src_compile() {
	einfo "change qemu binary"
	grep -ril '/usr/bin/kvm' src | xargs sed -i 's;/usr/bin/kvm;/usr/bin/qemu-system-x86_64;g'

	local myconf
	use mysql && myconf+="mysql=yes " || myconf+="mysql=no "
	use syslog && myconf+="syslog=yes " || myconf+="syslog=no "
	use sqlite && myconf+="sqlite3=yes " || myconf+="sqlite3=no "
	myconf+="new_xmlrcp=yes"
	einfo $myconf
	scons \
		${myconf} \
		$(sed -r 's/.*(-j\s*|--jobs=)([0-9]+).*/-j\2/' <<< ${MAKEOPTS})

	einfo "replace ruby interpretor"
	grep -ril '#!/usr/bin/env ruby' src share | xargs sed -i 's;#!/usr/bin/env ruby$;#!/usr/bin/env ruby19;g'
	einfo "change genisoimage to mkisofs"
	sed -i '/MKISOFS/c \
MKISOFS=mkisofs' src/mad/sh/scripts_common.sh
}

src_install() {
	./install.sh -u oneadmin -g oneadmin -d "${D}/${OPENNEBULA_DESTDIR}"
	dodir /etc/env.d
	echo "PATH=\"${OPENNEBULA_DESTDIR}/bin\"" >> "${D}/etc/env.d/30opennebula"
	echo "ROOTPATH=\"${OPENNEBULA_DESTDIR}/bin\"" >> "${D}/etc/env.d/30opennebula"
	echo "ONE_LOCATION=${OPENNEBULA_DESTDIR}" >> "${D}/etc/env.d/30opennebula"
}
