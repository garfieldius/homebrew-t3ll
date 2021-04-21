# Generated on 2021.04.21 16:04:44
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.3.tar.gz"
  sha256 "7f7a09f3cc971102ad11292e71b32be8989d8a27b59388d8b34b28a37a391359"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.3/"
    sha256 arm64_big_sur: "adac79facedf992f6fb5df2995ec9930bce2195cffc9c169309cb20afb326bc3"
    sha256 sierra:        "cd28abc146d104d68da1284cb5dd40863466741e39a6d50279ca59949d145b4b"
    sha256 x86_64_linux:  "09496d6b16e45ae00d8f5cb867673194e68842d385551696a1f82894e3f4c772"
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
