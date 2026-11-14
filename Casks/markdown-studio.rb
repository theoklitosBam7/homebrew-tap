cask "markdown-studio" do
  version "0.15.0"
  sha256 "53f5044e1cbfacc3ccdae076b1e4aca9a256f795f3fddf52d3f0928773ae5278"

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
