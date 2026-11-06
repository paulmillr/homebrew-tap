# Dispatch's updater reads this file as its feed (docs/releasing.md in paulmillr/dispatch, Mac automatic updates):
# keep exactly one literal `version "…"`, `sha256 "…"` and `url "…"` line, and the url exactly as it is.
cask "dispatch" do
  version "0.1.5"
  sha256 "f1981e55757721cdcd7b3792799f4e0029b871c3efd75ef60f533d5905734e47"

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

  # The helper's own uninstall removes Dispatch's agent hooks, Pi's extension and ~/.dispatch together; it refuses
  # while a Dispatch helper runs, and then leaves all of them, so no hook is left pointing at a deleted helper.
  zap script: {
        executable: "/bin/sh",
        args:       [
          "-c",
          'helper="$HOME/.dispatch/bin/dispatch-helper"; [ ! -x "$helper" ] || "$helper" uninstall || ' \
          'echo "Dispatch hooks and ~/.dispatch were kept: quit Dispatch, then run $helper uninstall" >&2',
        ],
      },
      trash:  [
        "#{appdir}/.Dispatch-update-*",
        "~/.config/dispatch/themes",
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
      ],
      rmdir:  "~/.config/dispatch"
end
