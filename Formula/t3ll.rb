
# Generated on 2021.02.12 13:52:01
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.1.tar.gz"
  sha256 "8f3d35e356fff19bc0f3f9dea701182aa7a279fffe31a2dc365e2c44547dc41c"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.1/"
    cellar :any_skip_relocation
    sha256 "f41455f6e4d35dde1af0219932c6c2d56083d087578266c6f6398d6d9857f3e2" => :x86_64_linux
    sha256 "c4cb17b3fcc6a96b846916e352e5d02228ba52b9f82b77afd7a6f405f9139ff2" => :sierra
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
