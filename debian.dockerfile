FROM ruby:3.0-slim-bullseye

ENV TINI_VERSION=0.18.0

# Do not split this into multiple RUN!
# Docker creates a layer for every RUN-Statement
# therefore an 'apt-get purge' has no effect
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  ca-certificates \
  && buildDeps=" \
  make gcc g++ libc-dev \
  wget bzip2 gnupg dirmngr \
  " \
  && apt-get install -y --no-install-recommends $buildDeps \
  && echo 'gem: --no-document' >> /etc/gemrc \
  && gem install oj -v 3.12.2 \
  && gem install json -v 2.5.1 \
  && gem install async-http -v 0.56.5\
  && gem install fluentd -v 1.14.6 \
  && gem install fluent-plugin-azure-loganalytics -v 0.7.0 \
  && gem install fluent-plugin-azurestorage-gen2 -v 0.3.3 \
  && gem install fluent-plugin-cloudwatch-logs -v 0.14.3 \
  && gem install fluent-plugin-concat -v 2.5.0 \
  && gem install fluent-plugin-datadog -v 0.14.2 \
  && gem install fluent-plugin-elasticsearch -v 5.2.3 \
  && gem install fluent-plugin-grafana-loki -v 1.2.18 \
  && gem install fluent-plugin-kafka -v 0.17.5 \
  && gem install fluent-plugin-opensearch -v 1.0.7 \
  && gem install fluent-plugin-prometheus -v 2.0.3 \
  && gem install fluent-plugin-record-modifier -v 2.1.0 \
  && gem install fluent-plugin-rewrite-tag-filter -v 2.4.0 \
  && gem install fluent-plugin-route -v 1.0.0 \
  && gem install fluent-plugin-s3 -v 1.7.0 \
  && gem install fluent-plugin-sqs -v 3.0.0 \
  && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
  && wget -O /usr/local/bin/tini "https://github.com/krallin/tini/releases/download/v$TINI_VERSION/tini-$dpkgArch" \
  && wget -O /usr/local/bin/tini.asc "https://github.com/krallin/tini/releases/download/v$TINI_VERSION/tini-$dpkgArch.asc" \
  && export GNUPGHOME="$(mktemp -d)" \
  && gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6380DC428747F6C393FEACA59A84159D7001A4E5 \
  && gpg --batch --verify /usr/local/bin/tini.asc /usr/local/bin/tini \
  && rm -r /usr/local/bin/tini.asc \
  && chmod +x /usr/local/bin/tini \
  && tini -h \
  && wget -O /tmp/jemalloc-4.5.0.tar.bz2 https://github.com/jemalloc/jemalloc/releases/download/4.5.0/jemalloc-4.5.0.tar.bz2 \
  && cd /tmp && tar -xjf jemalloc-4.5.0.tar.bz2 && cd jemalloc-4.5.0/ \
  && ./configure && make \
  && mv lib/libjemalloc.so.2 /usr/lib \
  && apt-get purge -y --auto-remove \
  -o APT::AutoRemove::RecommendsImportant=false \
  $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /usr/lib/ruby/gems/3.*/gems/fluentd-*/test

RUN groupadd --system --gid 2000 fluent && useradd --system --gid fluent --uid 2000 fluent \
  # for log storage (maybe shared with host)
  && mkdir -p /fluentd/log \
  && mkdir -p /fluentd/state \
  # configuration/plugins path (default: copied from .)
  && mkdir -p /fluentd/etc /fluentd/plugins \
  && chown -R fluent /fluentd && chgrp -R fluent /fluentd

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

ENV FLUENTD_CONF="fluent.conf"

ENV LD_PRELOAD="/usr/lib/libjemalloc.so.2"
EXPOSE 24224

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
