class Trans < Formula
  desc "Terminal AI translation tool powered by OpenAI"
  homepage "https://github.com/lian-yang/trans"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-amd64.tar.gz"
      sha256 "e27a786b1f05a715458b61f98f2e63f63768d1b015ee62283e8a2938f5155513"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-arm64.tar.gz"
      sha256 "b9861fe00a776d30f403bd276452986f1c57553e59dad5e81c7585aa66f20e55"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-amd64.tar.gz"
      sha256 "b722e456dbacdf56994ac57ecf4ea085efebe7aeaab8e1abc5e3553c497a9a82"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-arm64.tar.gz"
      sha256 "58572fc769ffd2c86a3d19e6070cd308d57b4c5714a3256ae9e077ce9440d84f"
    end
  end

  def install
    bin.install Dir["trans-*"].first => "trans"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/trans -V")
  end
end
