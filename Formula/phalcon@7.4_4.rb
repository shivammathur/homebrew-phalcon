require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT744 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v4.1.0.tar.gz"
  sha256 "3b98df3fd15560f30abbcf37b498536ad4d287699f5957b3ec37703491d3b594"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "2f0c43146800103c72001685ec9f8f9c64aa493102159d050abc8e394dc13310"
    sha256 cellar: :any_skip_relocation, big_sur:       "fe62950a7a8aa9e42a356c34d4aec9c41492a1dfb89516935a7a15b10c76db71"
    sha256 cellar: :any_skip_relocation, catalina:      "ffd3095e7088025a8a87c2f5f3ce519e9a1967d155ede9852d126c31fc4cd3fe"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.4"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
