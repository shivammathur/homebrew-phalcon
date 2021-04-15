require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT724 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v4.1.0.tar.gz"
  sha256 "3b98df3fd15560f30abbcf37b498536ad4d287699f5957b3ec37703491d3b594"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "e574090797cbf0007a8205f7c7371e534b98574cfe136a959ca12b3bbe121102"
    sha256 cellar: :any_skip_relocation, big_sur:       "bb85657d526dcd1b70516c50b88da8aee7fc8ee6c6759058d558f2485bc86efe"
    sha256 cellar: :any_skip_relocation, catalina:      "e4eb6001f0df5e753a604967acc1c089e5ad202052c5b32dd081782893e81f74"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.2"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
