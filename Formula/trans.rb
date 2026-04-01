class Trans < Formula
  desc "Terminal AI translation tool powered by OpenAI"
  homepage "https://github.com/lian-yang/trans"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-amd64.tar.gz"
      sha256 "8a12448048219e94fb015eb6ba68430e9990d3571b3d7993659a28d25c56b4cd"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-arm64.tar.gz"
      sha256 "63eb9912b065062ecbb209691359d8eee63ff982e9817fadc166440ac3d691ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-amd64.tar.gz"
      sha256 "2461ecfdfa5f15cf9f9eaa893d1ab3b6f0bd3633d170f483130affa2c0551e69"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-arm64.tar.gz"
      sha256 "eb8ea7c21c44b89f63facf5fb5fd151a0d92bf5e5940852f59268641cd81a4f6"
    end
  end

  def install
    bin.install Dir["trans-*"].first => "trans"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/trans -V")
  end
end
