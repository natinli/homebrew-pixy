cask "pixy" do
  version "0.0.1"
  sha256 "5bdfb42fb8fa87f92765fd4062aba298baae2dccdb3a9aceb9c8f759c03d39f8"

  url "https://github.com/natinli/Pixy/releases/download/v#{version}/Pixy-#{version}-universal-unsigned.zip"
  name "Pixy"
  desc "Finder-native image and video browser"
  homepage "https://github.com/natinli/Pixy"

  livecheck do
    url "https://github.com/natinli/Pixy/releases/latest"
    strategy :github_latest
  end

  depends_on :macos

  app "Pixy.app"

  caveats <<~EOS
    Pixy is ad-hoc signed and not notarized, so macOS blocks the first launch.
    Allow it once in System Settings → Privacy & Security → "Open Anyway",
    or run: xattr -dr com.apple.quarantine "#{appdir}/Pixy.app"
  EOS

  zap trash: [
    "~/Library/Application Support/FlowVision",
    "~/Library/Caches/com.natinli.Pixy",
    "~/Library/Preferences/com.natinli.Pixy.plist",
    "~/Library/Saved Application State/com.natinli.Pixy.savedState",
  ]
end
