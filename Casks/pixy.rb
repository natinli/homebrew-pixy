cask "pixy" do
  version "0.0.1"
  sha256 "5bdfb42fb8fa87f92765fd4062aba298baae2dccdb3a9aceb9c8f759c03d39f8"

  url "https://github.com/natinli/Pixy/releases/download/v#{version}/Pixy-#{version}-universal-unsigned.zip"
  name "Pixy"
  desc "Finder-native image and video browser for macOS"
  homepage "https://github.com/natinli/Pixy"

  livecheck do
    url "https://github.com/natinli/Pixy/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Pixy.app"

  zap trash: [
    "~/Library/Application Support/FlowVision",
    "~/Library/Caches/com.natinli.Pixy",
    "~/Library/Preferences/com.natinli.Pixy.plist",
    "~/Library/Saved Application State/com.natinli.Pixy.savedState",
  ]
end
