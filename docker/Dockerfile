FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
ENV PATH="/root/.local/bin:$PATH"

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
    libopencv-dev \
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
    zsh \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN usermod -s /bin/zsh root

WORKDIR /root
RUN git clone https://github.com/Newspaper8459/utils.git
RUN cp utils/config/.* /root 2>/dev/null || true
RUN cp utils/docker/.zshrc /root

RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

RUN mkdir ~/.config/sheldon -p

RUN cp utils/config/starship.toml ~/.config/
RUN cp utils/config/sheldon/plugins.toml ~/.config/sheldon

SHELL ["/bin/zsh", "-c"]
CMD ["/bin/zsh"]

# RUN echo 'export TERM=xterm-256color' >> /root/.bashrc && \
#     echo 'alias ls="ls --color=auto"' >> /root/.bashrc && \
#     echo 'export PS1="\\[\\e[1;32m\\]\\u@\\h\\[\\e[0m\\]:\\[\\e[1;36m\\]\\w\\[\\e[0m\\]\\$ "' >> /root/.bashrc

