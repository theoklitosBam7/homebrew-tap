cask "markdown-studio" do
  version "0.14.0"
  sha256 "93608b2b6fb55ca9b5a30db538b7855966af6faa51715315f2b7e35ea4157deb"

  url "https://github.com/theoklitosBam7/markdown-studio/releases/download/desktop-v#{version}/Markdown.Studio-#{version}-arm64.dmg"
  name "Markdown Studio"
  desc "Markdown editor with live preview and Mermaid diagram support"
  homepage "https://github.com/theoklitosBam7/markdown-studio"

  arch arm: "arm64"

  depends_on macos: :big_sur

  app "Markdown Studio.app"

  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/Markdown Studio.app"]
    touch "{{appdir}}/Markdown Studio.app/Contents/Resources/.homebrew-install"
  end

  zap delete: "~/Library/Application Support/Markdown Studio"
end
