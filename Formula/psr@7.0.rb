require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PsrAT70 < AbstractPhp70Extension
  init
  desc "PHP extension providing the accepted PSR interfaces "
  homepage "https://phalconphp.com/"
  url "https://github.com/jbboehr/php-psr/archive/v1.0.0.tar.gz"
  sha256 "f85be1d1434368abd16e06b81e394487f81b5e2706220f01c85558ba486ee3e7"
  head "https://github.com/jbboehr/php-psr.git"

  bottle do
    root_url "https://github.com/shivammathur/phalcon"
  end

  depends_on "pcre"

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-psr"
    system "make"
    prefix.install "modules/psr.so"
    prefix.install "modules/psr.la"
    write_config_file if build.with? "config-file"
  end
end
