
# Generated on 2020.04.24 10:01:12
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.5.3.tar.gz"
  sha256 "47916559ec9f07794534384dbfa22db020f236fd41b9947251dac06504cd7da5"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.3/"
    cellar :any_skip_relocation
    sha256 "e1db022d4cac04f91fb7a3c2dff63527de0a373b857169bb30b822a8880e6d17" => :x86_64_linux
    sha256 "851de52b7822e33900d6035200ef47695ea1fbb35d2379a37706738b49cb5d57" => :sierra
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
