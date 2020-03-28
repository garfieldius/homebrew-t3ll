
# Generated on 2020.03.28 17:16:24
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url " https://github.com/garfieldius/t3ll/archive/v0.5.0.tar.gz"
  sha256 "c9fb6369576706c7e889d9a6fe1c0cac1cf0a640a81876c9b7f6a41aaab849ca "

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.0/"
    cellar :any_skip_relocation
    sha256 "b56364e8fe4341041804274ab66a02d1431a0da62cac69b978cec58301806051" => :x86_64_linux
    sha256 "b731d1abe7f17c87761acd4e22542b8201ebff6c4653c077df3b5f65b9200159" => :sierra
  end

  def install
    system "make", "VERSION=v#{version}"
    system "mkdir", "-p", "#{bin}"
    system "cp", "t3ll", "#{bin}/t3ll"
  end

  test do
    system "#{bin}/t3ll", "version"
  end
end
