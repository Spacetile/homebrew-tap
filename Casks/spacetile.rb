cask "spacetile" do
  version "1.3.0"
  sha256 "06ea0b84513379b9585a796f51ca3ff13fa3db210e502804bcf1fbdb4599792a"

  url "https://updates.spacetile.app/Spacetile-#{version}.dmg"
  name "Spacetile"
  desc "Tiling window manager built on Spaces"
  homepage "https://spacetile.app/"

  # The appcast also carries Beta and Nightly items, tagged with a channel; only Stable counts
  livecheck do
    url "https://updates.spacetile.app/appcast.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.short_version
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Spacetile.app"

  uninstall quit: "com.kodehort.spacetile"

  zap trash: [
    "~/.config/spacetile",
    "~/Library/Preferences/com.kodehort.spacetile.plist",
  ]
end
