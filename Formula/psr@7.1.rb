require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PsrAT71 < AbstractPhp71Extension
  init
  desc "PHP extension providing the accepted PSR interfaces "
  homepage "https://phalconphp.com/"
  url "https://github.com/jbboehr/php-psr/archive/v0.7.0.tar.gz"
  sha256 "648aac07414f8c6e5c80728cf91fa8174bbd18dd41ae1a90168b510a507cf805"
  head "https://github.com/jbboehr/php-psr.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "14d37366838b90a00db279557b6e44ed9fe784ecbf94224a19f57069c716f765" => :catalina
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
