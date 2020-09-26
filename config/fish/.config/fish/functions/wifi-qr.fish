function wifi-qr
  set -l ssid (/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F' SSID: ' '/ SSID: / {print $2}')
  set -l passphrase (wifi-password --quiet)
  qrencode -s 10 -l H -o - -t utf8 "WIFI:T:WPA;S:$ssid;P:$passphrase;"
end

