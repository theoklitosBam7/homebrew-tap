# homebrew-tap

Custom Homebrew tap for macOS apps by [theoklitosBam7](https://github.com/theoklitosBam7).

## Usage

```sh
brew tap theoklitosbam7/tap
```

Then install any cask from this tap:

```sh
brew install --cask <cask-name>
```

Or install a cask directly without tapping first:

```sh
brew install --cask theoklitosbam7/tap/<cask-name>
```

## Available Casks

| Cask | Description | Version | Requirements |
|------|-------------|---------|--------------|
| [`markdown-studio`](Casks/markdown-studio.rb) | Markdown editor with live preview and Mermaid diagram support | 0.7.0 | macOS 11+, Apple Silicon |

## Updating Casks

Fetch the latest tap contents:

```sh
brew update
```

Then upgrade a specific cask:

```sh
brew upgrade --cask theoklitosbam7/tap/<cask-name>
```

Version and sha256 values are typically updated automatically by CI. To update a cask manually, edit the corresponding file in `Casks/`, commit, and push.

## Adding a New Cask

1. Create a Ruby file in `Casks/`:

   ```ruby
   cask "my-app" do
     version "1.0.0"
     sha256 "<sha256 of the download artifact>"

     url "https://example.com/my-app-#{version}.dmg"
     name "My App"
     desc "Short description"
     homepage "https://example.com"

     app "My App.app"
   end
   ```

2. Test locally:

   ```sh
   ln -s /path/to/this/repo "$(brew --repository)/Library/Taps/theoklitosbam7/homebrew-tap"
   brew install --cask theoklitosbam7/tap/my-app
   ```

3. Push the cask file.

See the [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) for the full cask DSL reference.

## License

Casks in this tap are provided under the same license as their respective upstream projects.
