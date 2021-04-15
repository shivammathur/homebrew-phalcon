require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT563 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "049c3dea111e67307b071684b84ee5c0e9108df0878c1c847fe85f84a6b40be9"
    sha256 cellar: :any_skip_relocation, big_sur:       "282883b67dff399ff98e9df53b55e6d175165c0be032765112cab640de99dcfd"
    sha256 cellar: :any_skip_relocation, catalina:      "159463f0ea6f3a0077c934f57c88bd915826e34f58827cd008541e468f3e7299"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@5.6"

  def install
    Dir.chdir "build/php5/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
