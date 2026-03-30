class Trans < Formula
  desc "Terminal AI translation tool powered by OpenAI"
  homepage "https://github.com/lian-yang/trans"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-amd64.tar.gz"
      sha256 "d8116fd21944844e1cf1cf92cdda19e2ee90f065a5223005280b15ef71a05e94"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-arm64.tar.gz"
      sha256 "125209b451f6ec05a5482bfc16c44c28bc01aee5d2ea73e30948391bcf3e59ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-amd64.tar.gz"
      sha256 "97fc265f7ccabe9bf06c6c5e9801efe7c9f8163a58b0de112f02f3ff3b2a5a71"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-arm64.tar.gz"
      sha256 "a57627c93426b6c84c5c331f8bb3128a86190202250f0c7ad4e14cb2232cc8f2"
    end
  end

  def install
    bin.install Dir["trans-*"].first => "trans"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/trans -V")
  end
end
