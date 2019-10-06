function reverse-mdns
  dig +noall +answer -p 5353 @224.0.0.251 -x $argv
end
