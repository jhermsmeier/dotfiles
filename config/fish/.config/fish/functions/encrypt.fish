function encrypt
  pbpaste | gpg2 --encrypt --armor | pbcopy
end
