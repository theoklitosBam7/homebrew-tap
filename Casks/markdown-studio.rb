cask "markdown-studio" do
  version "0.9.0"
  sha256 "d89277a5b3920268a05ad2611314404bf6241c603ed7f89836bc2a094947e3b8"

  url "https://github.com/theoklitosBam7/markdown-studio/releases/download/desktop-v#{version}/Markdown.Studio-#{version}-arm64.dmg",
      verified: "github.com/theoklitosBam7/markdown-studio"
  name "Markdown Studio"
  desc "Markdown editor with live preview and Mermaid diagram support"
  homepage "https://github.com/theoklitosBam7/markdown-studio"

  arch arm: "arm64"

  depends_on macos: :big_sur

  app "Markdown Studio.app"

  postflight do
    system_command "xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Markdown Studio.app"]
    system_command "touch",
      args: ["#{appdir}/Markdown Studio.app/Contents/Resources/.homebrew-install"]
  end

  zap delete: "~/Library/Application Support/Markdown Studio"
end
