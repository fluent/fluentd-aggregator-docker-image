# Fluentd Aggregator Docker Image Changelog

> [!NOTE]
> All notable changes to this project will be documented in this file; the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
### Added - For new features.
### Changed - For changes in existing functionality.
### Deprecated - For soon-to-be removed features.
### Removed - For now removed features.
### Fixed - For any bug fixes.
### Security - In case of vulnerabilities.
-->

## [UNRELEASED]

### Changed

- Update Ruby OCI image from `3.4.10` to [`3.4.11`](https://github.com/ruby/ruby/releases/tag/v3_4_11). ([#129](https://github.com/fluent/fluentd-aggregator-docker-image/pull/129)) @stevehipwell

## [v2.2.0] - 2026-10-01

### Changed

- Update [Ruby](https://hub.docker.com/_/ruby) OCI image digest. ([#121](https://github.com/fluent/fluentd-aggregator-docker-image/pull/121)) @dependabot
- Update [oj](https://rubygems.org/gems/oj) Gem from `3.17.4` to [`3.17.6`](https://github.com/ohler55/oj/releases/tag/v3.17.6). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluentd](https://rubygems.org/gems/fluentd) Gem from `1.19.3` to [`1.19.4`](https://github.com/fluent/fluentd/releases/tag/v1.19.4). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluent-plugin-datadog](https://rubygems.org/gems/fluent-plugin-datadog) Gem from `0.15.0` to [`0.15.1`](https://github.com/fluent/fluent-plugin-datadog/releases/tag/v0.15.1). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluent-plugin-kafka](https://rubygems.org/gems/fluent-plugin-kafka) Gem from `0.19.7` to [`0.19.8`](https://github.com/fluent/fluent-plugin-kafka/releases/tag/v0.19.8). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluent-plugin-opensearch](https://rubygems.org/gems/fluent-plugin-opensearch) Gem from `1.1.6` to [`1.1.7`](https://github.com/fluent/fluent-plugin-opensearch/releases/tag/v1.1.7). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluent-plugin-prometheus](https://rubygems.org/gems/fluent-plugin-prometheus) Gem from `2.2.2` to [`2.3.0`](https://github.com/fluent/fluent-plugin-prometheus/releases/tag/v2.3.0). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluent-plugin-rewrite-tag-filter](https://rubygems.org/gems/fluent-plugin-rewrite-tag-filter) Gem from `2.4.0` to [`2.4.1`](https://github.com/fluent/fluent-plugin-rewrite-tag-filter/releases/tag/v2.4.1). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot
- Update [fluent-plugin-s3](https://rubygems.org/gems/fluent-plugin-s3) Gem from `1.8.5` to [`1.8.6`](https://github.com/fluent/fluent-plugin-s3/releases/tag/v1.8.6). ([#127](https://github.com/fluent/fluentd-aggregator-docker-image/pull/127)) @dependabot

## [v2.1.0] - 2026-07-15

### Changed

- Switch `libxml-ruby` Gem for `nokogiri` Gem. ([#116](https://github.com/fluent/fluentd-aggregator-docker-image/pull/116)) @stevehipwell
- Update transient dependencies. ([#116](https://github.com/fluent/fluentd-aggregator-docker-image/pull/116)) @stevehipwell
- Update [Ruby](https://hub.docker.com/_/ruby) OCI image digest. ([#117](https://github.com/fluent/fluentd-aggregator-docker-image/pull/117)) @dependabot
- Update [oj](https://rubygems.org/gems/oj) Gem from `3.17.3` to [`3.17.4`](https://github.com/ohler55/oj/releases/tag/v3.17.4). ([#119](https://github.com/fluent/fluentd-aggregator-docker-image/pull/119)) @dependabot

## [v2.0.0] - 2026-07-06

### Changed

- Realign to original [stevehipwell/fluentd-aggregator](https://github.com/stevehipwell/fluentd-aggregator) source. ([#113](https://github.com/fluent/fluentd-aggregator-docker-image/pull/113)) @stevehipwell

## [v2.0.0-rc.1] - 2026-07-06

### Changed

- Realigned to original [stevehipwell/fluentd-aggregator](https://github.com/stevehipwell/fluentd-aggregator) source. ([#113](https://github.com/fluent/fluentd-aggregator-docker-image/pull/113)) @stevehipwell

## [v1.2.0] - 2023-02-06

### All Changes

- Updated [Alpine](https://www.alpinelinux.org/) base image from `v3.17.0` to `v3.17.1` (still Ruby `v3.1.3`).
- Updated Debian Ruby base image from `v3.1.3-slim-bullseye` to `v3.2.0-slim-bullseye`.
- Updated [libxml-ruby](https://github.com/xml4r/libxml-ruby) Gem from `v3.2.4` to `v4.0.0`.
- Updated [async-http](https://github.com/socketry/async-http) Gem from `v0.59.3` to `v0.60.1`.
- Updated [oj](https://github.com/ohler55/oj) from `v3.13.23` to `v3.14.1`.

### [v1.1.0] - 2022-12-07

#### All Changes

- Updated `fluent-plugin-opensearch` to `v1.0.9`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) @stevehipwell
- Updated `json` from `v2.6.2` to `v2.6.3`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) @stevehipwell
- Added `libxml-ruby` to support AWS gems. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) @stevehipwell
- Updated _Alpine_ from `v3.16.3` to `v3.17.0`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) @stevehipwell
- Updated _Debian_ from `v3.1.2-slim-bullseye` to `v3.1.3-slim-bullseye`. ([#34](https://github.com/fluent/fluentd-aggregator-docker-image/pull/34)) @stevehipwell

### [v1.0.0] - 2022-11-21

#### All Changes

- Added initial version based on Fluentd [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3). @stevehipwell

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/fluent/fluentd-aggregator-docker-image/compare/v2.2.0...HEAD
[v2.2.0]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v2.2.0
[v2.1.0]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v2.1.0
[v2.0.0]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v2.0.0
[v2.0.0-rc.1]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v2.0.0-rc.1
[v1.2.0]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v1.2.0
[v1.1.0]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v1.1.0
[v1.0.0]: https://github.com/fluent/fluentd-aggregator-docker-image/releases/tag/v1.0.0
