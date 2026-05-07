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
export PYTHONHASHSEED=0

# --- uv ---
eval "$(uv generate-shell-completion zsh)"

# --- エイリアス ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word

WORDCHARS=''

