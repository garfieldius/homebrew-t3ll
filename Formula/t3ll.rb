
# Generated on 2020.03.28 18:10:54
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
    sha256 "a23f77e168d5144b586661f8f72ab1da70e9c1a3e055d90159280025c4aa3615" => :x86_64_linux
    sha256 "088357f25ad61c86f32d1b3f3a007c00cce9e4827c6635c7a9d6d160603eb6ba" => :sierra
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
