# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/paint/paint-0.8.6-r1.ebuild,v 1.1 2013/10/30 04:02:11 mrueg Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

# RUBY_FAKEGEM_RECIPE_DOC="rdoc"
# RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://www.yoshidam.net/Ruby.html"

LICENSE="ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
