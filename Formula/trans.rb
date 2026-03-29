class Trans < Formula
  desc "Terminal AI translation tool powered by OpenAI"
  homepage "https://github.com/lian-yang/trans"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-amd64.tar.gz"
      sha256 "2bcbb94f53dc55d2ee3b443a467b1622094ec9109a4f86969bd92aba322698ca"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-arm64.tar.gz"
      sha256 "68ed3161f0b970e6f5fd81c87d2ef572955454f661f48648079a01e0f7ad32bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-amd64.tar.gz"
      sha256 "e1efc44a6cd0fc036aed05f3a6dc135579e03bc08b312e9c082cb43775c06554"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-arm64.tar.gz"
      sha256 "1048f5210c2513799183adae9f2583985ea60a983c161a53a9bdfb0eb227488a"
    end
  end

  def install
    bin.install Dir["trans-*"].first => "trans"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trans -V")
  end
end
