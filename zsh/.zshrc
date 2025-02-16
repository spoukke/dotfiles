# ==============================
# 🌹 Rosé Pine Minimal Zsh Config with Powerlevel10k
# ==============================

# Enable Powerlevel10k instant prompt (fast startup)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set Zsh as the default shell
export SHELL=/bin/zsh

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set Powerlevel10k as theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable colors
autoload -U colors && colors
export TERM="xterm-256color"

# ==============================
# 🎨 Rosé Pine Colors
# ==============================
RP_BG="#191724"
RP_FG="#e0def4"
RP_ACCENT="#ebbcba"
RP_COMMENT="#6e6a86"
RP_CURSOR="#eb6f92"

# Customize LS_COLORS (for `ls --color=auto`)
export LS_COLORS="di=${RP_ACCENT}:ln=${RP_COMMENT}:so=${RP_CURSOR}:pi=${RP_COMMENT}:ex=${RP_ACCENT}:bd=${RP_COMMENT}:cd=${RP_CURSOR}:su=${RP_CURSOR}:sg=${RP_CURSOR}:tw=${RP_CURSOR}:ow=${RP_CURSOR}"

# ==============================
# ⚡ Oh My Zsh & Powerlevel10k
# ==============================

# Install Oh My Zsh if not installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k if not installed
if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k prompt settings
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ==============================
# ⚡ Basic Config
# ==============================
setopt prompt_subst           # Allow command substitution in prompt
setopt hist_ignore_all_dups   # Ignore duplicate history entries
setopt hist_reduce_blanks     # Remove extra spaces from commands in history
setopt inc_append_history     # Save each command as it's entered
setopt share_history          # Share history between terminals

# ==============================
# 🚀 Final Setup
# ==============================
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Start in home directory
cd ~
