#!/usr/bin/env bash
# Setup script for setting up a new macos machine

echo "Starting setup"

# install xcode CLI
#xcode-select --install


# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update
brew upgrade

# Install Mas (command-line interface for Mac App Store)
brew install mas

# Search for Xcode showing only the first 5 results
#mas search xcode | head -5
# Install Xcode using App ID
#mas install 497799835 # The appid for Xcode shown when doing search

#sudo xcode-select -r  # Reset the development directory path to put to Xcode /Applications/Xcode.app/Contents/Developer

#sudo xcodebuild -license

# Updaate all Apple software and auto agree to any licenses and restart if necessary
#sudo softwareupdate --install --agree-to-license -aR

# Install GNU core utilities (those that come with OS X are outdated)
#brew tap homebrew/dupes
#brew install coreutils
#brew install gnu-sed --with-default-names
#brew install gnu-tar --with-default-names
#brew install gnu-indent --with-default-names
#brew install gnu-which --with-default-names
#brew install gnu-grep --with-default-names

# Install taps

TAPS=(
    koekeishiya/formulae
    homebrew/cask-fonts
)
echo "Installing taps..."
brew tap ${TAPS[@]}

PACKAGES=(
    bat
    chezmoi
    fd
    findutils
    fzf
    git
    jq
    lsd
    midnight-commander
    neofetch
    pfetch
    Karabiner
    skhd
    telnet
    tmux
    tree
    vim
    wget
    yabai
    zsh
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."

CASKS=(
    1password/tap/1password-cli
    dropbox
    firefox
    font-hack-nerd-font
    hammerspoon
    iterm2
    karabiner-elements
    macvim
    microsoft-remote-desktop
    slack
    sublime-text
    tunnelblick
    vlc
    zoom
)

echo "Installing cask apps..."
brew install ${CASKS[@]} --cask

echo "Installtion complete"

