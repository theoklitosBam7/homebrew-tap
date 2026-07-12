cask "markdown-studio" do
  version "0.12.0"
  sha256 "eaeb4b0742530382a22410fc1a921ecad379b64f0aae4390d98f8cd366407d96"

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
