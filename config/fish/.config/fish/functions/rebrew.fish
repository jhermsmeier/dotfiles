function rebrew --description 'Homebrew: update, upgrade & clean'
  brew update; and brew upgrade; and brew cleanup -s --prune=0
end
