
# Generated on 2020.04.01 11:30:13
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.5.2.tar.gz"
  sha256 "8aa2ea0b56728b98933b7088133d97dcc58b7e7731666f2989d28f9300eb817d "

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.2/"
    cellar :any_skip_relocation
    sha256 "50cd5bd1705c1e6c157ff1f7b87502cd476ec306f2f1cfdd23c1c43c3f044b77" => :x86_64_linux
    sha256 "f51fd446d6906ca1f05466c0a4fda34bebe54e6e8d0ed1551894fd33ea4db6f8" => :sierra
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
