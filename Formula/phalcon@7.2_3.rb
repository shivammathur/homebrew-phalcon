require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT723 < AbstractPhp72Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    rebuild 4
    sha256 "bce4424d5b3f5808f99c059bea7d9e0c88bfdb8f206ad704fcd574b89f188590" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.2"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
