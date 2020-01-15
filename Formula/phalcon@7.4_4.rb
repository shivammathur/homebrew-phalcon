require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT744 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.0.tar.gz"
  sha256 "b8c8c5c331fed6c216ed5f799aadd3c06dac66e9b814a48c38ec9df4eb4c642c"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
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
