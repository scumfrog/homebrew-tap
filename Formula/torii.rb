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
  version "0.1.2"

  if OS.mac? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-arm64"
    sha256  "064e750f2a59e0940764811ecfea1c33a856b70da5f5b7b25c7bb563c97fab92"
  elsif OS.mac?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-x64"
    sha256  "a45759314500b3dd9c76077140f1a22692f038e2f6d5f4bf9db64e7ec2706b54"
  elsif OS.linux? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-arm64"
    sha256  "950ba931bba021dabab85e06acbf2f6ee4980bd353555407c96271693a06d827"
  else
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-x64"
    sha256  "e2628c46d11658cbfbccc75c5b865b6ee881e13ed62af304b8bae1ad65a5430c"
  end

  def install
    bin.install Dir["torii-*"].first => "torii"
  end

  test do
    assert_match "torii", shell_output("#{bin}/torii --version 2>&1", 1)
  end
end
