require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT713 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "33f83f86b08a76222bc35da6dd5cbe4a0e9847a6c6c9ba53a84ecc56ab237abe"
    sha256 cellar: :any_skip_relocation, big_sur:       "88362be60a358f3acfdcde2f2b3665b76688d329172f2f6c283c5ba6407bfced"
    sha256 cellar: :any_skip_relocation, catalina:      "6fe12585feca84f4a10c29f0987d5c708cecb0316ba9224887a6e779be5f50ef"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.1"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
