cask "dispatch" do
  version "0.1.1"
  sha256 "7d8272fa700c6e69af5c484003702a45deb4e730a2c90605243f469e288c6a13"

  url "https://github.com/paulmillr/dispatch/releases/download/#{version}/Dispatch-#{version}.dmg"
  name "Dispatch"
  desc "Terminal that turns agent CLIs into chats and maps tmux tabs to native tabs"
  homepage "https://github.com/paulmillr/dispatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Dispatch.app"

  zap trash: [
    "~/Library/Application Support/Dispatch",
    "~/Library/Caches/dev.dispatch.local",
    "~/Library/Caches/yachts.dispatch.app",
    "~/Library/Logs/Dispatch",
    "~/Library/Preferences/dev.dispatch.local.plist",
    "~/Library/Preferences/yachts.dispatch.app.plist",
    "~/Library/Saved Application State/dev.dispatch.local.savedState",
    "~/Library/Saved Application State/yachts.dispatch.app.savedState",
  ]
end
