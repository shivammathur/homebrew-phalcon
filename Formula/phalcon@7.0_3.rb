require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT703 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "e9345de8274cfd08c0614824735de3da65a265a7ace803c4e7d6c24d60ea8dc9"
    sha256 cellar: :any_skip_relocation, big_sur:       "f3dee45aed252a2f65a019b7f742288e7336c65f2391041b1ab0c2279607b5df"
    sha256 cellar: :any_skip_relocation, catalina:      "07f0aef1a7f28bc97dd761a7584de13bb68962c005eb835b24710237b9892efc"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.0"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
