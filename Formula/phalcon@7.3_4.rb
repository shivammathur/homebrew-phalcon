require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT734 < AbstractPhp73Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.5.tar.gz"
  sha256 "b6b618911a4dfe60ba63708d92811d4885b8b5220c45981ff1cb7750523074f4"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    sha256 "ef2358a9c6461153a7fe5d8a8d28a3f67b4c10549976ba7e71e52af82713c5d0" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.3"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
