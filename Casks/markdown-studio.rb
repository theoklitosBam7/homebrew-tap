cask "markdown-studio" do
  version "0.15.1"
  sha256 "0f1e6b1f676f3a95d8eb3128c32d9d14537e02ddbc903a94db1f6c0907d991c8"

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
