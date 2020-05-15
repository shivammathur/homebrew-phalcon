class AbstractPhpVersion < Formula
  desc "Abstract class for PHP Versions"
  homepage "https://github.com/shivammathur/homebrew-phalcon"

  module Php70Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.0.33.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.0.33".freeze
    PHP_BRANCH      = "PHP-7.0.33".freeze
    PHP_FORMULA     = "shivammathur/php/php@7.0".freeze

    PHP_CHECKSUM    = {
      :sha256 => "4933ea74298a1ba046b0246fe3771415c84dfb878396201b56cb5333abe86f07",
    }.freeze
  end

  module Php71Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.1.33.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.1.33".freeze
    PHP_BRANCH      = "PHP-7.1.33".freeze
    PHP_FORMULA     = "shivammathur/php/php@7.1".freeze

    PHP_CHECKSUM    = {
      :sha256 => "95a5e5f2e2b79b376b737a82d9682c91891e60289fa24183463a2aca158f4f4b",
    }.freeze
  end

  module Php72Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.2.31.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.2.31".freeze
    PHP_BRANCH      = "PHP-7.2.31".freeze
    PHP_FORMULA     = "shivammathur/php/php@7.2".freeze

    PHP_CHECKSUM    = {
      :sha256 => "1ba7559745d704f39764a5deb002eb94f5cb8d9aaa219a6b8b32b94174e8a700",
    }.freeze
  end

  module Php73Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.3.18.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.3.18".freeze
    PHP_BRANCH      = "PHP-7.3.18".freeze
    PHP_FORMULA     = "shivammathur/php/php@7.3".freeze

    PHP_CHECKSUM    = {
      :sha256 => "749d21f65deb57153b575f846705f5db54732c6b672e80612b29dcf1a53be8a4",
    }.freeze
  end

  module Php74Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.4.6.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.4.6".freeze
    PHP_BRANCH      = "PHP-7.4.6".freeze
    PHP_FORMULA     = "homebrew/core/php".freeze

    PHP_CHECKSUM    = {
      :sha256 => "a6ed9475695d2056322a3f2c00fee61a122a7fce138a0e25694320c5dd1d2348",
    }.freeze
  end
end
