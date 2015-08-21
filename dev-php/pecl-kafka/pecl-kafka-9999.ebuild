EAPI=5

PHP_EXT_NAME="kafka"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-5 php5-6"

inherit php-ext-source-r2 git-2

KEYWORDS="~amd64 ~x86"

EGIT_REPO_URI="git://github.com/EVODelavega/phpkafka.git"

DESCRIPTION="PHP extension for Apache Kafka"
LICENSE="PHP 3.01"
SLOT="0"

DEPEND="
  dev-libs/librdkafka
"
RDEPEND="${DEPEND}"

src_compile() {
	my_conf="--enable-kafka"

	php-ext-source-r2_src_compile
}

src_install() {
	php-ext-source-r2_src_install
}
