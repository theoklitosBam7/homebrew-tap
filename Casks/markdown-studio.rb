cask "markdown-studio" do
  version "0.8.1"
  sha256 "2cfdb1d34200fa4e70f2737ecc8ccfc19cb0fdd8e1fcf0c37dec199d4ac07246"

  url "https://github.com/theoklitosBam7/markdown-studio/releases/download/desktop-v#{version}/Markdown.Studio-#{version}-arm64.dmg",
      verified: "github.com/theoklitosBam7/markdown-studio"
  name "Markdown Studio"
  desc "Markdown editor with live preview and Mermaid diagram support"
  homepage "https://github.com/theoklitosBam7/markdown-studio"

  arch arm: "arm64"

  depends_on macos: ">= :big_sur"

  app "Markdown Studio.app"

  postflight do
    system_command "xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Markdown Studio.app"]
    system_command "touch",
      args: ["#{appdir}/Markdown Studio.app/Contents/Resources/.homebrew-install"]
  end

  uninstall delete: "#{appdir}/Markdown Studio.app"

  zap delete: "~/Library/Application Support/Markdown Studio"
end
