cask "markdown-studio" do
  version "0.12.2"
  sha256 "109ca3429d66f025257b27cad6a6fda5ecaf19ab365b636642b91952c1d354f2"

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
