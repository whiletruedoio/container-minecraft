<!--
reference: https://keepachangelog.com
-->

# Changelog

This file is the changelog of
[container-template](https://github.com/whiletruedoio/container-minecraft).

## [Unreleased]

## [1.19.0] - 20220716

This release includes Minecraft 1.19 and also some minor adjustments for the
handling of versions.

### Added

- enforce-secure-profile configuration option (default: true)
- hide-online-players configuration option (default: false)
- max-chained-neighbor-updates configuration option (default: 1000000)
- previews-chat configuration option (default: false)
- simulation-distance configuration option (default: 10)

### Changed

- Minecraft Version is 1.19
- Variables for minecraft version and url are no longer in the entrypoint, but
  in the Dockerfile
- configuration paramaters updated to match 1.19
- configuration parameters in envfile and entrypoint adjusted to the order of
  the wiki (mostly alphabetical)
- configuration option "level-type" changed to new behavior
  (default: minecraft:normal)
- Documentation slightly adjusted

### Removed

- max-build-height configuration option

## [1.18.2] - 20220509

- Initial setup
- Includes Minecraft 1.18.2

## [MAJOR.MINOR.PATCH-LABEL] - YYYYMMDD

<!--
Describe the purpose of this release.
Each of the below sections should contain the links to the fixed issues.
-->

### Added

<!--
Section for new Features and Additions.
Most likely a MINOR or MAJOR update.
-->

### Changed

<!--
Changed Behavior in API or Application.
Most likely a MAJOR update.
-->

### Deprecated

<!--
Deprecation, which will be removed in a future release.
The future release must be mentioned.
-->

### Removed

<!--
Removals or Deletions, which were deprecated beforehand.
Most likely a Minor or Major update.
-->

### Fixed

<!--
Bugfixes or other minor fixes.
Most likely a patch.
-->
