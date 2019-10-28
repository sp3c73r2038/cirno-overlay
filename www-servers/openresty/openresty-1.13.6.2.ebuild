EAPI="5"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc x86 ~x86-fbsd ~amd64-linux ~x86-linux"

SRC_URI="https://openresty.org/download/${P}.tar.gz"

IUSE="luajit +pcre pcre-jit"
DEPEND="
	pcre? ( >=dev-libs/libpcre-4.2 )
	pcre-jit? ( >=dev-libs/libpcre-8.20[jit] )
	dev-libs/openssl"

REQUIRED_USE="pcre-jit? ( pcre )"

inherit eutils user

pkg_setup() {
	OPENRESTY_HOME="/var/lib/openresty"
	OPENRESTY_HOME_TMP="${OPENRESTY_HOME}/tmp"

	ebegin "Creating openresty user and group"
	enewgroup ${PN}
	enewuser ${PN} -1 -1 "${OPENRESTY_HOME}" ${PN}
	eend $?
}

src_prepare() {
	epatch_user
}

src_configure() {
	cd "${S}"

	local myconf= http_enabled= mail_enabled= myldconf=

	use pcre      && myconf+=" --with-pcre"
	use pcre-jit  && myconf+=" --with-pcre-jit"

	if ! use prefix; then
		myconf+=" --user=${PN} --group=${PN}"
	fi

	./configure \
		--prefix="${EPREFIX}"/opt/openresty \
		--conf-path="${EPREFIX}"/etc/${PN}/${PN}.conf \
		--error-log-path="${EPREFIX}"/var/log/${PN}/error_log \
		--pid-path="${EPREFIX}"/run/${PN}.pid \
		--lock-path="${EPREFIX}"/run/lock/${PN}.lock \
		--with-cc-opt="-I${EROOT}usr/include" \
		--with-ld-opt="-L${EROOT}usr/$(get_libdir) ${myldconf}" \
		--http-log-path="${EPREFIX}"/var/log/${PN}/access_log \
		--http-client-body-temp-path="${EPREFIX}/${OPENRESTY_HOME_TMP}"/client \
		--http-proxy-temp-path="${EPREFIX}/${OPENRESTY_HOME_TMP}"/proxy \
		--http-fastcgi-temp-path="${EPREFIX}/${OPENRESTY_HOME_TMP}"/fastcgi \
		--http-scgi-temp-path="${EPREFIX}/${OPENRESTY_HOME_TMP}"/scgi \
		--http-uwsgi-temp-path="${EPREFIX}/${OPENRESTY_HOME_TMP}"/uwsgi \
		${myconf} || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install

	# just keepdir. do not copy the default htdocs files (bug #449136)
	keepdir /var/www/localhost
	rm -rf "${D}"/usr/html || die

	# set up a list of directories to keep
	local keepdir_list="${OPENRESTY_HOME_TMP}"/client
	keepdir_list+=" ${OPENRESTY_HOME_TMP}/proxy"
	keepdir_list+=" ${OPENRESTY_HOME_TMP}/fastcgi"
	keepdir_list+=" ${OPENRESTY_HOME_TMP}/scgi"
	keepdir_list+=" ${OPENRESTY_HOME_TMP}/uwsgi"

	keepdir /var/log/${PN} ${keepdir_list}

	# this solves a problem with SELinux where nginx doesn't see the directories
	# as root and tries to create them as nginx
	fperms 0750 "${OPENRESTY_HOME_TMP}"
	fowners ${PN}:0 "${OPENRESTY_HOME_TMP}"

	fperms 0700 /var/log/${PN} ${keepdir_list}
	fowners ${PN}:${PN} /var/log/${PN} ${keepdir_list}
}
