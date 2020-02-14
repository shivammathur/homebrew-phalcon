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
    rebuild 3
    sha256 "4e65ba0a6e00fd92318dcb17413c8ad1661c5514315b7fd921deb9b1a5c8b0c5" => :catalina
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
