# Define required packages
PACKAGES = bspwm sxhkd polybar dunst rofi alacritty picom stow nitrogen feh \
           network-manager-gnome pulseaudio-utils playerctl xbacklight acpi \
           curl x11-xserver-utils unclutter brightnessctl pavucontrol git zsh \
           thunar thunar-archive-plugin thunar-volman gvfs gvfs-backends tumbler ffmpegthumbnailer \
           udisks2 xclip xdotool lm-sensors htop bat ripgrep

# Default target: install packages and setup config
all: packages ohmyzsh-install p10k-install config set-zsh

# Install necessary packages
packages:
	@echo "📦 Installing required packages..."
	@sudo apt update && sudo apt install -y $(PACKAGES)
	@echo "✅ Packages installed!"

# Install Oh My Zsh if not installed
ohmyzsh-install:
	@echo "🐚 Installing Oh My Zsh..."
	@if [[ ! -d "$HOME/.oh-my-zsh" ]]; then \
	  sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
	fi
	@echo "✅ Oh My Zsh installed!"

# Install Powerlevel10k if not installed
p10k-install:
	@echo "🎨 Installing Powerlevel10k..."
	@if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then \
	  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k; \
	fi
	@echo "✅ Powerlevel10k installed!"

# Use GNU Stow to symlink dotfiles
config:
	@echo "🔗 Stowing dotfiles into home directory..."
	@stow -t $(HOME) zsh
	@echo "🚀 Configuration applied!"

# Set Zsh as the default shell
set-zsh:
	@echo "🐚 Setting Zsh as the default shell..."
	@chsh -s $(which zsh)
	@echo "✅ Zsh is now the default shell!"

# Clean up symlinks
clean:
	@echo "🧹 Removing symlinked dotfiles..."
	@stow -D -t $(HOME) zsh || true
	@echo "✅ Cleanup complete!"

.PHONY: all packages ohmyzsh-install p10k-install config clean set-zsh
