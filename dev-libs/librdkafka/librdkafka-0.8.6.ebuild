EAPI=5

SRC_URI="https://github.com/edenhill/librdkafka/archive/0.8.6.tar.gz -> ${PF}.tar.gz"
DESCRIPTION="The Apache Kafka C/C++ library"
HOMEPAGE="https://github.com/edenhill/librdkafka"
SLOT="0"
LICENSE=""

KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-libs/zlib
"
