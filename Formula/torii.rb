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
  version "0.1.14"

  if OS.mac? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-arm64"
    sha256  "ca0d67191d81f777bb72372e140e40bc6a41c04c2f82dde9e97ec79f375000fc"
  elsif OS.mac?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-darwin-x64"
    sha256  "748826bb61ec562f486a0c62a9b320a791c516a304ee8f2005d1dbb30ffe9098"
  elsif OS.linux? && Hardware::CPU.arm?
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-arm64"
    sha256  "af7a3624844c48fe89a8b9457b05e56d50b5ef83250b63c19c7744ac61ad34d5"
  else
    url     "https://github.com/scumfrog/torii/releases/download/v#{version}/torii-linux-x64"
    sha256  "e5bb53c36af3790ca1ac61459dd87d979011c3668bcf903eb4cd6f264201a4b5"
  end

  def install
    bin.install Dir["torii-*"].first => "torii"
  end

  test do
    assert_match "torii", shell_output("#{bin}/torii --version 2>&1", 1)
  end
end
