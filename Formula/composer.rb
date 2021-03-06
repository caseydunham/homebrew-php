require 'formula'
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/composer-requirement", __FILE__)

class Composer < Formula
  homepage 'http://getcomposer.org'
  head 'https://getcomposer.org/composer.phar'
  url 'http://getcomposer.org/download/1.0.0-alpha10/composer.phar'
  sha1 '5913d2b2a0cb07e9a2d620bd1f66340ec676e28a'
  version '1.0.0-alpha10'

  depends_on PhpMetaRequirement
  depends_on ComposerRequirement

  def install
    libexec.install "composer.phar"
    sh = libexec + "composer"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/composer.phar \"$@\"")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "composer --version".

    You can read more about composer and packagist by running:
      "brew home composer".
    EOS
  end

end
