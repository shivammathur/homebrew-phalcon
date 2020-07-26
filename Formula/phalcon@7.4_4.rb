require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT744 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.6.tar.gz"
  sha256 "dd3c09547670470def92b1b0cd598626ee6d0c2b7071810709fa1a4c61b9a7c0"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    sha256 "9a6f82273cc6f3dd50f196fe15b71a19a0e40f3ab9f274bdc73f07138b7f173f" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.4"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
