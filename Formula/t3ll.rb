
# Generated on 2021.03.09 16:06:53
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.2.tar.gz"
  sha256 "2f0fe9e725874ac54eff0d237af185f96315b92016362be03c563a1499e30e30"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.2/"
    cellar :any_skip_relocation
    sha256 "704dbc3c178cae7599fb0f21c6a4c40374efe53e735157f60d29240d9fadeb95" => :x86_64_linux
    sha256 "d24a0dc1295398e4bd8ff6144c21c2f01b8272e1774dff92c5f0dfb21d3c20cd" => :sierra
    sha256 "__SHASUM_MACOS_ARM__" => :arm64_big_sur
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
