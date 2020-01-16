require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT744 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.2.tar.gz"
  sha256 "db54ad12010e2f38c4a573e4552362f9199bbdd828033546e676bb466c5dbaf0"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    sha256 "901e2f50b34d9b28a3f224b5cf1fa18130ad2f14b736efbd59379e19fd5aa33a" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.4"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
