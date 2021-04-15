require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT723 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "1b3bda11915862aebac3357cd9f63f4843b9882ab95840668a6c2269a89837c1"
    sha256 cellar: :any_skip_relocation, big_sur:       "edafbcfcb07d7f984d30bb4edcb03d5d0b1e2fc3b7654b165fa630f5a6fc072b"
    sha256 cellar: :any_skip_relocation, catalina:      "058a5d00291113a9f092faa36f93ac2fc83af42fb10022f9b1ec8ca5c5db1533"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.2"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
