# -*- mode: ebuild -*-

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md ISSUES.md UPGRADING.md"

# RUBY_FAKEGEM_GEMSPEC="#{PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="An easy way to vendor gem dependencies"
HOMEPAGE="http://github.com/carhuda/bundler"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_rdepend virtual/rubygems

ruby_add_bdepend "test? ( app-text/ronn )"

RDEPEND+=" dev-vcs/git"
DEPEND+=" test? ( dev-vcs/git )"

# all_ruby_prepare() {
# }
