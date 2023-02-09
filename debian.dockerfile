FROM ruby:3.2.1-slim-bullseye@sha256:859d417c0f7ef41cc57a90af94b14734623ff9714dd39b160a28c597e1b30c33

ENV FLUENTD_DISABLE_BUNDLER_INJECTION="1"

COPY Gemfile Gemfile.lock /fluentd/

# Do not split this into multiple RUN!
# Docker creates a layer for every RUN-Statement
# therefore an 'apt-get purge' has no effect
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  ca-certificates \
  libjemalloc2 \
  libxml2 libxslt1.1 \
  tini \
  && buildDeps=" \
  make gcc g++ libc-dev \
  wget bzip2 gnupg dirmngr \
  libxml2-dev libxslt1-dev \
  " \
  && apt-get install -y --no-install-recommends $buildDeps \
  && echo 'gem: --no-document' >> /etc/gemrc \
  && gem install bundler --version 2.3.7 \
  && bundle config silence_root_warning true \
  && bundle install --gemfile=/fluentd/Gemfile \
  && gem sources --clear-all \
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
  && chown -R fluent:fluent /fluentd

COPY fluent.conf /fluentd/etc/
COPY --chmod=755 entrypoint.sh /bin/

ENV FLUENTD_CONF="fluent.conf"

ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.2"
EXPOSE 24224

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
