require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PsrAT74 < AbstractPhp74Extension
  init
  desc "PHP extension providing the accepted PSR interfaces "
  homepage "https://github.com/jbboehr/php-psr"
  url "https://github.com/jbboehr/php-psr/archive/v1.0.0.tar.gz"
  sha256 "f85be1d1434368abd16e06b81e394487f81b5e2706220f01c85558ba486ee3e7"
  head "https://github.com/jbboehr/php-psr.git"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/phalcon"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "f564c66ed7dae5ac78f3746584636fe742a779267ae0e5a3f91f3bfcab4d038f" => :catalina
  end

  depends_on "pcre"

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-psr"
    system "make"
    prefix.install "modules/psr.so"
    prefix.install "modules/psr.la"
    write_config_file
  end
end
