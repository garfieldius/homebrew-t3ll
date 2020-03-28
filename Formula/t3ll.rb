
# Generated on 2020.03.28 18:19:25
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.5.1.tar.gz"
  sha256 "c9699e4aebda3faf08cbe31333360fe6b30c2a60657b3893082d3752a4ec5cb4 "

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.1/"
    cellar :any_skip_relocation
    sha256 "e096d8b410ae86a889c4fc5dc8806c864caed4d54a65ae2295d0cb3392942f98" => :x86_64_linux
    sha256 "9de84384c8505f8f69f541552a36a891b70f5bbe9a3492e12f9083f7f203b02d" => :sierra
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
