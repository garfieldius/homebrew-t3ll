
# Generated on 2020.03.28 17:53:20
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.5.0.tar.gz"
  sha256 "c9fb6369576706c7e889d9a6fe1c0cac1cf0a640a81876c9b7f6a41aaab849ca "

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.0/"
    cellar :any_skip_relocation
    sha256 "8015b496dedfe1cc5008f508b9b599dec0414d5f06d5ab48aadfa0e3bcd5b917" => :x86_64_linux
    sha256 "835c78cdb4d46c36f11923d5369b11bfe77394c61d0317226024c548650dac58" => :sierra
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
