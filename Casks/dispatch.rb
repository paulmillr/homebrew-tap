cask "dispatch" do
  version "0.1.0"
  sha256 "0891ac6e725913ed3a36c10229faa70a8d48ae302a13eb61aa18e00d2ea77346"

  url "https://github.com/paulmillr/dispatch/releases/download/#{version}/Dispatch-#{version}.zip"
  name "Dispatch"
  desc "Terminal that turns agent CLIs into chats and maps tmux tabs to native tabs"
  homepage "https://github.com/paulmillr/dispatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Dispatch.app"

  zap trash: [
    "~/Library/Application Support/Dispatch",
    "~/Library/Caches/dev.dispatch.local",
    "~/Library/Logs/Dispatch",
    "~/Library/Preferences/dev.dispatch.local.plist",
    "~/Library/Saved Application State/dev.dispatch.local.savedState",
  ]
end