# Fluentd Aggregator Docker Image

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/fluent/fluentd-aggregator-docker-image?sort=semver)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/fluent/fluentd-aggregator?sort=semver)](https://hub.docker.com/r/fluent/fluentd-aggregator)
![linux](https://img.shields.io/badge/os-linux-brightgreen)
![amd64](https://img.shields.io/badge/arch-amd64-brightgreen)
![arm64](https://img.shields.io/badge/arch-arm64-brightgreen)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A [Fluentd](https://www.fluentd.org/) [OCI](https://opencontainers.org/) image to be used for log aggregation and based on the official [Fluentd Docker image](https://github.com/fluent/fluentd-docker-image) rebuilt as a multi-arch `linux/amd64` & `linux/arm64` image.

## Aggregation Changes

To optimise _Fluentd_ for log aggregation the default `fluent.conf` file has been overwritten to allow logs to be forwarded and printed to `stdout`, an additional directory `/fluentd/state` has been created, and plugins have also been added to support the aggregation role.

### Plugins

The following plugins have been added to the base image, to see the specific version please look in the [Gemfile](./Gemfile).

- [fluent-plugin-azure-loganalytics](https://github.com/yokawasa/fluent-plugin-azure-loganalytics)
- [fluent-plugin-azurestorage-gen2](https://github.com/oleewere/fluent-plugin-azurestorage-gen2)
- [fluent-plugin-cloudwatch-logs](https://github.com/fluent-plugins-nursery/fluent-plugin-cloudwatch-logs)
- [fluent-plugin-concat](https://github.com/fluent-plugins-nursery/fluent-plugin-concat)
- [fluent-plugin-datadog](https://github.com/DataDog/fluent-plugin-datadog)
- [fluent-plugin-elasticsearch](https://docs.fluentd.org/output/elasticsearch)
- [fluent-plugin-grafana-loki](https://github.com/grafana/loki/tree/main/clients/cmd/fluentd)
- [fluent-plugin-kafka](https://github.com/fluent/fluent-plugin-kafka)
- [fluent-plugin-opensearch](https://github.com/fluent/fluent-plugin-opensearch)
- [fluent-plugin-prometheus](https://github.com/fluent/fluent-plugin-prometheus)
- [fluent-plugin-record-modifier](https://github.com/repeatedly/fluent-plugin-record-modifier)
- [fluent-plugin-rewrite-tag-filter](https://github.com/fluent/fluent-plugin-rewrite-tag-filter)
- [fluent-plugin-route](https://github.com/tagomoris/fluent-plugin-route)
- [fluent-plugin-s3](https://docs.fluentd.org/output/s3)
- [fluent-plugin-sqs](https://github.com/ixixi/fluent-plugin-sqs)

## Usage

This image is available at [Docker Hub](https://hub.docker.com/r/fluent/fluentd-aggregator); the image version matches the _Fluentd_ version that it's based on.

This image can be pulled with the following commands.

```shell
docker pull fluent/fluentd-aggregator:latest

docker pull ghcr.io/fluent/fluentd-aggregator:latest
```

This image can be tested by running the following command and then forwarding logs.

```shell
docker run -p 24224:24224 fluent/fluentd-aggregator:latest
```

## License

[Apache License, Version 2.0](./LICENSE).
