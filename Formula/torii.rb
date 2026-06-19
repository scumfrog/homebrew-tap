# This file lives in this repo for reference. The actual formula consumed
# by `brew install torii/tap/torii` should live at:
#
#   github.com/scumfrog/homebrew-tap → Formula/torii.rb
#
# The `dawidd6/action-homebrew-bump-formula` step in .github/workflows/release.yml
# bumps the version + SHA in that repo automatically on every git tag push here.

class Torii < Formula
  desc "The secure gateway for AI tools — sits between MCP clients and servers"
  homepage "https://usetorii.dev"
  license "MIT"
  version "0.1.7"

  if OS.mac? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-arm64"
    sha256  "8aba488c8485a799c33fc21de07972a4a418c1f86878f52ba6406c41342f0950"
  elsif OS.mac?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-x64"
    sha256  "d426384500ed092b93a79dd0787270285936f420c99a85b64dee1b4454897f7c"
  elsif OS.linux? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-arm64"
    sha256  "0e2762898f3bd1555f37c17e0c8f732553c1cdd7bbabb9237594fb6dd41c4436"
  else
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-x64"
    sha256  "a2400e120e6afcd2e7d410c3234d2045953c2f2d29f9652fe9a0eb3219ad1508"
  end

  def install
    bin.install Dir["torii-*"].first => "torii"
  end

  test do
    assert_match "torii", shell_output("#{bin}/torii --version 2>&1", 1)
  end
end
