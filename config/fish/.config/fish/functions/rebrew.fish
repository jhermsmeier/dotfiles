function rebrew --description 'Homebrew: update, upgrade & clean'
  brew update
  brew upgrade
  brew cleanup --prune=0 -s
  fish_update_completions
end
