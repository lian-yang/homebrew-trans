class Trans < Formula
  desc "Terminal AI translation tool powered by OpenAI"
  homepage "https://github.com/lian-yang/trans"
  version "1.0.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-amd64.tar.gz"
      sha256 "f4007b06b56e17591f2ec882d648de02bb54afbf6822c42eedaf59a0b4265fb1"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-arm64.tar.gz"
      sha256 "b009ff97db3f8d41968c8e0668eeba1ce9a38cd5f3b28989cde252a072a5501d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-amd64.tar.gz"
      sha256 "09f4bef94c36aac0d3912ce3c37145e2016e42ada3ddfe6f1bf5de5a248d7c3d"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-arm64.tar.gz"
      sha256 "4db5d490b3cce555ec4d8a0effca97ee2c2fb651c6487978e8e9bea1afe05efa"
    end
  end

  def install
    bin.install Dir["trans-*"].first => "trans"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/trans -V")
  end
end
