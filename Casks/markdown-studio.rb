cask "markdown-studio" do
  version "0.12.1"
  sha256 "8244ec0e601470a2c2bf5eaaa59b19abddee3eb185dd9781c1e9561226588bc3"

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
