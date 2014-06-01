# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/celluloid/celluloid-0.15.2-r2.ebuild,v 1.1 2013/11/18 01:52:10 mrueg Exp $

EAPI=5
# rbx or jruby recommended, but only in 1.9 mode.
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
#Needed by dev-ruby/listen
RUBY_FAKEGEM_EXTRAINSTALL="spec"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

inherit ruby-fakegem

DESCRIPTION="Evented sockets for Celluloid actors"
HOMEPAGE="https://github.com/celluloid/celluloid-io"
SRC_URI="https://github.com/celluloid/celluloid-io/archive/v${PV}.tar.gz -> ${P}-git.tgz"
IUSE=""
SLOT="0"

LICENSE="MIT"
KEYWORDS="~amd64"

ruby_add_rdepend "
		>=dev-ruby/celluloid-0.15.0
		>=dev-ruby/nio4r-0.5.0"

# all_ruby_prepare() {
# 	rm Gemfile .rspec || die

# 	sed -i -e '/coveralls/I s:^:#:' spec/spec_helper.rb || die
# }
