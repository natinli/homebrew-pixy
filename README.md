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

Pixy is ad-hoc signed, not notarized. That is why this cask lives in a personal tap rather
than `homebrew/cask`, which requires every cask to pass Homebrew's Gatekeeper check —
`brew audit` on this cask fails on exactly that, by design.

Homebrew *does* apply `com.apple.quarantine` to what it downloads (`--no-quarantine` no longer
exists in current Homebrew), so the **first launch after each install or upgrade still needs one
manual approval**:

- System Settings → Privacy & Security → scroll down → "Open Anyway", or
- `xattr -dr com.apple.quarantine /Applications/Pixy.app`

What the tap buys you is everything around that: one command to install and upgrade instead of
downloading, mounting and dragging a DMG each time, and `brew uninstall --zap` to remove the
app together with its preferences, caches and search index.

It also matters if you already use FlowVision: `brew install flowvision` installs the upstream
app, not this fork.

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
