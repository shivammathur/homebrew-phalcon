require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT724 < AbstractPhp72Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.3.tar.gz"
  sha256 "4ecad36651f33f7cfa909adedac25fee4527ee44b3843680b63b97898daa07bb"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    sha256 "a36a1a420f83156fe3d07a266663cb41b86bd08b946b1840d6ab5fd443f25350" => :catalina
  end

  depends_on "pcre"
  depends_on "psr@7.2"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
