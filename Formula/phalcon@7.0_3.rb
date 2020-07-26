require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT703 < AbstractPhp70Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "822fdf0a39d14fb6b4347eba84b43c2fdb903958763fe1f6027ca828d52ff0f4" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.0"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
