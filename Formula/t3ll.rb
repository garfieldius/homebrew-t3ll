
# Generated on 2020.11.03 10:23:37
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.5.5.tar.gz"
  sha256 "0878064353249455df4460fc5eec9633a2a8fef7047009da2a42584475a5d0ad"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.5/"
    cellar :any_skip_relocation
    sha256 "84a7a5c680351c1822eed1dd4e8b7628b0f8e5eeccb81aebbd495a14ce2ed96b" => :x86_64_linux
    sha256 "a4e43a0bf7d077479efe07b1cfa07e406132c4cf8c36a8914c364ea68916e2fd" => :sierra
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
