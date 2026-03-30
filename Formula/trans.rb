class Trans < Formula
  desc "Terminal AI translation tool powered by OpenAI"
  homepage "https://github.com/lian-yang/trans"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-amd64.tar.gz"
      sha256 "701f7a89d304b300f56b1b2556d742dd520dd8876a3c319feba14fd7ff291d52"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-darwin-arm64.tar.gz"
      sha256 "e97d670b5a9c8efa43ba7c355dfe1c799a0f90cfc828c927739b3083ab5555df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-amd64.tar.gz"
      sha256 "3d524d5d459a182bac87c3431c53e121572f504c881620d84557d5b7ec3c29af"
    else
      url "https://github.com/lian-yang/trans/releases/download/v#{version}/trans-linux-arm64.tar.gz"
      sha256 "bf3fe41e23db662c99c01e4594aaa0c11f0139ebcdbb0cd1aa90df8dff23bbf8"
    end
  end

  def install
    bin.install Dir["trans-*"].first => "trans"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/trans -V")
  end
end
