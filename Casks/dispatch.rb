cask "dispatch" do
  version "0.1.3"
  sha256 "0aba0bb17016f40e94e8dba103b7832e79e1bbd60b40c8d298acb95cf93abca7"

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
    "~/Library/Caches/yachts.dispatch.pilot.app",
    "~/Library/Logs/Dispatch",
    "~/Library/Preferences/dev.dispatch.local.plist",
    "~/Library/Preferences/yachts.dispatch.app.plist",
    "~/Library/Preferences/yachts.dispatch.pilot.app.plist",
    "~/Library/Saved Application State/dev.dispatch.local.savedState",
    "~/Library/Saved Application State/yachts.dispatch.app.savedState",
    "~/Library/Saved Application State/yachts.dispatch.pilot.app.savedState",
  ]
end
