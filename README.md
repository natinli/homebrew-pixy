# homebrew-pixy

Homebrew tap for [Pixy](https://github.com/natinli/Pixy) — a Finder-native image and video
browser for macOS, forked from [FlowVision](https://github.com/netdcy/FlowVision).

## Install

```sh
brew install --cask natinli/pixy/pixy
```

Or tap first, then install by name:

```sh
brew tap natinli/pixy
brew install --cask pixy
```

## Upgrade

```sh
brew upgrade --cask pixy
```

Pixy has no built-in updater, so `brew upgrade` is how you get new versions.

## Uninstall

```sh
brew uninstall --cask pixy           # remove the app
brew uninstall --cask --zap pixy     # also remove preferences, caches and the search index
```

## Notes

Pixy is not signed with a Developer ID and not notarized. This is why the cask lives in a
personal tap instead of `homebrew/cask`, which requires casks to pass Gatekeeper assessment.

Installing through Homebrew means the download is fetched with `curl`, which does **not** set
the `com.apple.quarantine` attribute — so the app launches normally without the "仍要打开" /
"Open Anyway" detour that a browser download needs. If macOS ever does block it, either open
System Settings → Privacy & Security and allow it, or run:

```sh
xattr -dr com.apple.quarantine /Applications/Pixy.app
```

The alternative is to
[build from source](https://github.com/natinli/Pixy#building-from-source), which avoids the
issue entirely.

## Updating this tap

The cask pins an exact version and checksum, so it needs a bump on every release. From a
checkout of the Pixy repository:

```sh
./scripts/update-cask.sh
```

It pulls the checksum from the release's `SHA256SUMS.txt`, rewrites `Casks/pixy.rb` in this
tap's checkout, commits and pushes. Pass a version to override the one in `project.pbxproj`:

```sh
./scripts/update-cask.sh 0.0.2
```
