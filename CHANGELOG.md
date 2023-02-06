# Fluentd Aggregator Docker Image Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [vX.Y.Z] - UNRELEASED
### Highlights
### All Changes
- Added
- Updated
- Changed
- Fixed
- Deprecated
- Removed -->

## [v1.2.0] - 2023-02-06

### All Changes

- Updated [Alpine](https://www.alpinelinux.org/) base image from `v3.17.0` to `v3.17.1` (still Ruby `v3.1.3`).
- Updated Debian Ruby base image from `v3.1.3-slim-bullseye` to `v3.2.0-slim-bullseye`.
- Updated [libxml-ruby](https://github.com/xml4r/libxml-ruby) Gem from `v3.2.4` to `v4.0.0`.
- Updated [async-http](https://github.com/socketry/async-http) Gem from `v0.59.3` to `v0.60.1`.
- Updated [oj](https://github.com/ohler55/oj) from `v3.13.23` to `v3.14.1`.

## [v1.1.0] - 2022-12-07

### All Changes

- Updated `fluent-plugin-opensearch` to `v1.0.9`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) [@stevehipwell](https://github.com/stevehipwell)
- Updated `json` from `v2.6.2` to `v2.6.3`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) [@stevehipwell](https://github.com/stevehipwell)
- Added `libxml-ruby` to support AWS gems. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) [@stevehipwell](https://github.com/stevehipwell)
- Updated _Alpine_ from `v3.16.3` to `v3.17.0`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) [@stevehipwell](https://github.com/stevehipwell)
- Updated _Debian_ from `v3.1.2-slim-bullseye` to `v3.1.3-slim-bullseye`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) [@stevehipwell](https://github.com/stevehipwell)

## [v1.0.0] - 2022-11-21

### All Changes

- Added initial version based on Fluentd [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3). [@stevehipwell](https://github.com/stevehipwell)
