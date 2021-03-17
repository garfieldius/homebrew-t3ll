# Generated on 2021.03.17 14:22:21
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.2.tar.gz"
  sha256 "2f0fe9e725874ac54eff0d237af185f96315b92016362be03c563a1499e30e30"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.2/"
    sha256 arm64_big_sur: "40d556ea7b7ff95a424bf3c15e16d5bd6c12daf426781e7dffa8f17a9fe09202"
    sha256 sierra:        "d24a0dc1295398e4bd8ff6144c21c2f01b8272e1774dff92c5f0dfb21d3c20cd"
    sha256 x86_64_linux:  "704dbc3c178cae7599fb0f21c6a4c40374efe53e735157f60d29240d9fadeb95"
  end

  depends_on "go"   => :build
  depends_on "make" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build

  def install
    system "make", "VERSION=v#{version}"
    mkdir_p bin.to_s
    cp "t3ll", bin.to_s
  end

  test do
    system "#{bin}/t3ll", "version"
  end
end
