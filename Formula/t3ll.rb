# Generated on 2021.05.21 15:44:11
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.4.tar.gz"
  sha256 "3f2ee20f25b187f6812e6215d39448713973ee90de5e104b61130745eabe240c"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.4/"
    sha256 arm64_big_sur: "ef3716e4754f1791a198572ca64189d17a994c87da72d365e7bee98f2d1af355"
    sha256 sierra:        "548580a5e4843c2cf6e4cc73e5c61f448635dc5e7a8232fe7184605deab8967b"
    sha256 x86_64_linux:  "fdf45e55277950aedafaf3d8cb76ed38a8d03475c60ce7c453cbf5b7bdce9c99"
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
