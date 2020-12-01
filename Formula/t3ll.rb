
# Generated on 2020.12.01 14:56:36
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.0.tar.gz"
  sha256 "04942c4b8a3387360976bdd353227aba366b856bee122a33d916c16249bf02e4"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.0/"
    cellar :any_skip_relocation
    sha256 "aff578f9c27cfea12af00927bd56a910a1d6609c3bfbae1ae0072c50a24fb2f2" => :x86_64_linux
    sha256 "04982b7750d0109dbddc5879deefea18514d75f5eb33e34d40f64ac81fe7ab13" => :sierra
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
