FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN apt update && apt upgrade -y && apt install -y \
    unzip \
    unrar \
    git \
    curl \
    wget \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    vim \
    openssh-server \
    imagemagick \
    btop \
    nvtop \
    tmux \
    gh \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

WORKDIR /root
RUN git clone https://github.com/Newspaper8459/utils.git
RUN cp utils/config/.* /root 2>/dev/null || true
RUN cp utils/docker/.bashrc /root

RUN echo 'export TERM=xterm-256color' >> /root/.bashrc && \
    echo 'alias ls="ls --color=auto"' >> /root/.bashrc && \
    echo 'export PS1="\\[\\e[1;32m\\]\\u@\\h\\[\\e[0m\\]:\\[\\e[1;36m\\]\\w\\[\\e[0m\\]\\$ "' >> /root/.bashrc

