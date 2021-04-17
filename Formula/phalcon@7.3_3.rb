require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT733 < AbstractPhpExtension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalcon.io/en-us"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.5.tar.gz"
  sha256 "4c56420641a4a12f95e93e65a107aba8ef793817da57a4c29346c012faf66777"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/phalcon"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "7be74f2a08708252c8c814ef7dd3cb6537c527cdeecfb78f0cf663f37f5aab03"
    sha256 cellar: :any_skip_relocation, big_sur:       "6378d158f80d4dfdb06b77638a4f9ddbdb9c929db7fd9376e9eae2dd2547e82a"
    sha256 cellar: :any_skip_relocation, catalina:      "22e30702dd156e9ebadf80be767d0231a67c18a59bf4c7e591187067e582d257"
  end

  depends_on "pcre"
  depends_on "shivammathur/extensions/psr@7.3"

  def install
    Dir.chdir "build/php7/64bits"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file
  end
end
