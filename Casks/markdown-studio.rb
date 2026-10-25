cask "markdown-studio" do
  version "0.13.0"
  sha256 "9d1197226efcd1d696131c152c9ad351b289ee5ba1872a3233587a8e097bae3a"

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
