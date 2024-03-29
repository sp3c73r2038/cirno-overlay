# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# QA: This is an upstream binary package, must not be added to main tree.

EAPI=5

inherit eutils

SR=SR${PV#*.*.}
SRC_BASE="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/${SR}/eclipse-java-juno-${SR}-linux-gtk"
SRC_BASE="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/${SR}/eclipse-jee-juno-${SR}-linux-gtk"

DESCRIPTION="Eclipse SDK for Java EE Developers"
HOMEPAGE="http://www.eclipse.org"
SRC_URI="
	amd64? ( ${SRC_BASE}-x86_64.tar.gz&r=1 -> eclipse-jee-juno-${SR}-linux-gtk-x86_64-${PV}.tar.gz )
	x86? ( ${SRC_BASE}.tar.gz&r=1 -> eclipse-jee-juno-${SR}-linux-gtk-${PV}.tar.gz )"

LICENSE="EPL-1.0"
SLOT="4.2"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=virtual/jdk-1.6
	x11-libs/gtk+:2"

S=${WORKDIR}/eclipse

src_install() {
	local dest=/opt/${PN}-${SLOT}

	insinto ${dest}
	doins -r features icon.xpm plugins artifacts.xml p2 eclipse.ini configuration dropins

	exeinto ${dest}
	doexe eclipse

	dohtml -r about.html about_files epl-v10.html notice.html readme/*

	insinto /etc
	doins "${FILESDIR}"/eclipserc-ee-bin-${SLOT}

	dobin "${FILESDIR}"/eclipse-ee-bin-${SLOT}
	make_desktop_entry "eclipse-ee-bin-${SLOT}" "Eclipse Java EE ${PV} (bin)" "${dest}/icon.xpm"

	# At least CDT needs the following dir to exist to be installable, doesn't
	# need to be writable though.
	keepdir "${dest}"/dropins
}
