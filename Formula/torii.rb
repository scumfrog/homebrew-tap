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
  version "0.1.8"

  if OS.mac? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-arm64"
    sha256  "9a88510c4c674e4531c4f8b9c4797c6bd1710c28b9860e0a0e3559d93f7f2f84"
  elsif OS.mac?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-x64"
    sha256  "bf9d646dd9a706cb48636e1bb9102fd2db0b557178f05a8258f6fb55c27c40b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-arm64"
    sha256  "9f0cf36b80be2393232dd0d360b1f9071cddb2fcbaff322daa4079e52e316981"
  else
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-x64"
    sha256  "ad13a3d70db31a684dc7fbc2fcb043570d5a8fb76cd269b261750df231afdcb1"
  end

  def install
    bin.install Dir["torii-*"].first => "torii"
  end

  test do
    assert_match "torii", shell_output("#{bin}/torii --version 2>&1", 1)
  end
end
