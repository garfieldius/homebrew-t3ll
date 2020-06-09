
# Generated on 2020.06.09 14:01:46
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.5.4.tar.gz"
  sha256 "9454c8e8e87915c5971cac65b8895f3376077021b9661467457835dd23659d65"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "make" => :build
  depends_on "yarn" => :build

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.5.4/"
    cellar :any_skip_relocation
    sha256 "5abf07f172906b4af794748f683bd3e6395909a0ad3069e344017d71d8988d3c" => :x86_64_linux
    sha256 "b52c8a0daaf53b01c5bfa22aef417cd78fc13ad81ad990602395a7571bccf198" => :sierra
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
