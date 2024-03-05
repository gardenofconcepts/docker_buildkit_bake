# syntax=docker/dockerfile:1.6

# https://github.com/docker-library/docker/blob/master/25/dind-rootless/Dockerfile
FROM docker:25-dind-rootless

USER root

ARG DOCKER_UID=1000
ARG DOCKER_USER=rootless
ARG TZ=Europe/Berlin

ENV DOCKER_HOST="unix:///run/user/$DOCKER_UID/docker.sock" \
    DOCKER_DIND=true \
    DOCKER_UID=$DOCKER_UID \
    DOCKER_BUILDKIT="1" \
    BUILDKIT_PROGRESS="plain" \
    HOME=/home/$DOCKER_USER \
    TZ=$TZ

RUN apk add --no-cache \
        git \
        openssh-client \
        bash \
        zsh \
        tree \
        curl \
        shadow \
        tzdata \
        bind-tools \
        just \
        docker-zsh-completion \
        curl-zsh-completion \
        git-zsh-completion \
        zsh-syntax-highlighting \
        qemu \
        bat \
        nano

RUN <<EOT
  set -ex
  mkdir -p -m 0775 /commandhistory
  touch /commandhistory/.zsh_history
  chown -R $DOCKER_USER:$DOCKER_USER $HOME/.local /commandhistory
EOT

USER $DOCKER_USER

VOLUME /commandhistory

RUN --mount=type=tmpfs,target=/fonts <<EOT
  set -ex
  mkdir -p $HOME/.local/share/fonts/
  git clone https://github.com/powerline/fonts.git --depth=1 /fonts
  cd /fonts && ./install.sh
EOT

RUN <<EOT
  set -ex
  ln -sf /commandhistory/.zsh_history $HOME/.zsh_history
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  mkdir -p -m 0700 $HOME/.ssh
  ssh-keyscan gitlab.com >> $HOME/.ssh/known_hosts
  chsh $DOCKER_USER -s /bin/zsh
  echo "alias bake='docker buildx bake'" >> $HOME/.zshrc
EOT
