FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive

RUN touch /etc/apt/apt.conf \
    && echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf \
    && echo 'APT::Install-Suggests "0";'  > /etc/apt/apt.conf

ADD entrypoint /usr/local/bin/entrypoint
ADD wait4tcp /usr/local/bin/wait4tcp
ADD cleanup /usr/local/bin/cleanup
ADD start-supervisor.sh /usr/local/bin/start-supervisor

RUN chmod +x /usr/local/bin/entrypoint /usr/local/bin/wait4tcp /usr/local/bin/cleanup

RUN apt-get update \
    && apt-get install -yqq --no-install-recommends curl zip git ca-certificates openssh-client less vim supervisor \
    && useradd -g 33 -ou 1000 -m deploy \
    && cleanup

ENTRYPOINT ["/usr/local/bin/entrypoint"]