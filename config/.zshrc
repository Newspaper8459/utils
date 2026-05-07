# Sheldon
eval "$(sheldon source)"

# Starship
eval "$(starship init zsh)"

# ---- 以下は既存の設定をそのまま移植 ----

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history          # 複数セッション間で履歴を共有
setopt hist_ignore_dups       # 重複を記録しない
setopt hist_ignore_space      # スペース始まりは記録しない
IGNOREEOF=10

# 補完
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# labcode関数など既存のbash設定もここに移植
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PYTHONHASHSEED=0

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion

# --- uv ---
. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"

# --- エイリアス ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias vpnup='sudo nmcli connection up "dred" passwd-file ~/.vpn-secret'
alias vpndown='sudo nmcli connection down "dred"'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word

WORDCHARS=''

mount-dred() {
  local MOUNTPOINT="$HOME/dred/"
  local REMOTE="dred4:/home/dredvpn016/sandbox/"

  if mountpoint -q "$MOUNTPOINT"; then
    if ! timeout 3 ls "$MOUNTPOINT" &>/dev/null; then
      echo "Stale mount detected, cleaning up..."
      fusermount -uz "$MOUNTPOINT"
    else
      echo "Already mounted and alive: $MOUNTPOINT"
      return 0
    fi
  fi

  sshfs "$REMOTE" "$MOUNTPOINT" \
    -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
  echo "Mounted $REMOTE -> $MOUNTPOINT"
}

