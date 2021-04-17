require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT734 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v4.1.0.tar.gz"
  sha256 "3b98df3fd15560f30abbcf37b498536ad4d287699f5957b3ec37703491d3b594"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "62a8e5d2d0f80472dc00be3d0624eeedbbaf501e54d0cc9209ca8279d8eb0577"
    sha256 cellar: :any_skip_relocation, big_sur:       "fa89128eb91a9c3958de920fd9daef9fe769c0a4673ca71043819293acd24d78"
    sha256 cellar: :any_skip_relocation, catalina:      "46f25633895237b27c7ce41665638c1954c81744d850799828b8d1dfa4e55bae"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.3"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
