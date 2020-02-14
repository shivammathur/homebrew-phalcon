require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT734 < AbstractPhp73Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.3.tar.gz"
  sha256 "4ecad36651f33f7cfa909adedac25fee4527ee44b3843680b63b97898daa07bb"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "5ae7014d23bf2519fd88770e64d9d15a3f5581bd9841c09470da97715155cfdf" => :catalina
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
