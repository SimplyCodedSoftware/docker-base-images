FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

ADD entrypoint /usr/local/bin/entrypoint
ADD wait4tcp /usr/local/bin/wait4tcp
ADD cleanup /usr/local/bin/cleanup

RUN chmod +x /usr/local/bin/entrypoint /usr/local/bin/wait4tcp /usr/local/bin/cleanup

RUN apt-get update \
    && apt-get install -yqq --no-install-recommends curl zip git ca-certificates openssh-client less vim \
    && useradd -ou 1000 -m deploy \
    && cleanup

ENTRYPOINT ["/usr/local/bin/entrypoint"]