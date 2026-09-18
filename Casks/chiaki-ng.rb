cask "chiaki-ng" do
  arch arm: "arm64", intel: "amd64"

  version "1.10.0"
  sha256 arm:   "72eed7494614477dc1012b951e90ebeb212d84cdbcfa04e16adb330a022ad467",
         intel: "5611a01c2354f528b80651e428900c1233d3f6cd233ae90932589f20b8d10739"

  url "https://github.com/streetpea/chiaki-ng/releases/download/v#{version}/chiaki-ng-macos_#{arch}-Release.dmg"
  name "chiaki-ng"
  desc "PlayStation remote play client next-generation"
  homepage "https://streetpea.github.io/chiaki-ng/"

  livecheck do
    url "https://github.com/streetpea/chiaki-ng/releases"
  end

  app "chiaki-ng.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/chiaki-ng.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Chiaki",
    "~/Library/Preferences/com.chiaki.Chiaki.plist",
  ]
end
