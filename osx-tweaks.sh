
#!/bin/bash
# inspired by Mathias Bynens: https://github.com/mathiasbynens/dotfiles

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

echo "Root password needed to run OSX customization of settings:"
# Ask for the administrator password upfront
  sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# General
# =======

echo "Setting computer name..." # (as done via System Preferences -> Sharing)
  sudo scutil --set ComputerName "RedBaron"
  sudo scutil --set HostName "RedBaron"
  sudo scutil --set LocalHostName "RedBaron"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "RedBaron"
  
# Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  
# Check for software updates daily, not just once per week
  defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Add iOS Simulator to Launchpad
  ln -s /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app /Applications/iOS\ Simulator.app
  
# Enable the Develop menu and the Web Inspector in Safari
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
  

# Screen
# ======

# Save screenshots to the downlaods.
  defaults write com.apple.screencapture location "$HOME/Downloads/"

# Sound
# =====

# Disable the Startup Chime
  sudo nvram SystemAudioVolume=" "

# Trackpad
# ========

# Secondary click
  defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Finder
# ======

# Use columns view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `Flwv`
  defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  
# Show the ~/Library folder
  chflags nohidden ~/Library

# Finder: allow text selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
