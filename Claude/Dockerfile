FROM node:22

RUN apt-get update && apt-get install -y --no-install-recommends \
    git less sudo zsh fzf jq make openssh-client \
    ca-certificates curl gnupg \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg \
       | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
       https://download.docker.com/linux/debian bookworm stable" \
       > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli docker-compose-plugin \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) \
       signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
       https://cli.github.com/packages stable main" \
       > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update && apt-get install -y gh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG HOST_DOCKER_GID=983
RUN groupadd -g ${HOST_DOCKER_GID} hostdocker || true

RUN usermod -l claude -d /home/claude -m -s /bin/zsh node \
    && groupmod -n claude node \
    && usermod -aG ${HOST_DOCKER_GID} claude \
    && echo "claude ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/claude

RUN mkdir -p /workspace /repo /worktrees /home/claude/.claude \
    && chown -R claude:claude /workspace /repo /worktrees /home/claude/.claude

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin
RUN mkdir -p /usr/local/share/npm-global && chown -R claude:claude /usr/local/share

USER claude
RUN npm install -g @anthropic-ai/claude-code@latest

ENV TERM=xterm-256color
ENV COLORTERM=truecolor
ENV SHELL=/bin/zsh
ENV NODE_OPTIONS=--max-old-space-size=4096

COPY --chown=claude:claude entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
