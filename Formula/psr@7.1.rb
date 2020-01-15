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
    rebuild 2
    sha256 "ec5757696d0866956e62ef56b60ff5f359298ef56f8f0f177e59e4034b8e58c5" => :catalina
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
