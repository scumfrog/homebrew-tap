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
  version "0.1.12"

  if OS.mac? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-arm64"
    sha256  "44ccd075257d9629b6c2ca5cb1b5853b4c6c50ddd3583d758a95647435753a47"
  elsif OS.mac?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-x64"
    sha256  "590142cac2ced50da8cf19dd8101fb123e3d38612d8a9b0f93af7a43d1f776b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-arm64"
    sha256  "8e421c89a7a51077b00591784a56559fe03d2b3fe4165ec0ca54619d3b30beec"
  else
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-x64"
    sha256  "c56682a7c4d286d5f853fc3608f654faeb4abd19d437f29c03fd754b7d1f4ba5"
  end

  def install
    bin.install Dir["torii-*"].first => "torii"
  end

  test do
    assert_match "torii", shell_output("#{bin}/torii --version 2>&1", 1)
  end
end
