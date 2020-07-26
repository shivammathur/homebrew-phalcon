require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT734 < AbstractPhp73Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.6.tar.gz"
  sha256 "dd3c09547670470def92b1b0cd598626ee6d0c2b7071810709fa1a4c61b9a7c0"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "c8f2b2bbfb69664e73921a4ac220ceb792284ae09873ac3d1a3995b99c10a055" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.3"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
