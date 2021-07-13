#!/usr/bin/env bash

# Available settings can be found in `chrome_settings.proto` in the
# Chromium source: https://source.chromium.org/chromium/chromium/src/

# Disable Sec-CH-UA-* headers
defaults write org.chromium.Chromium UserAgentClientHintsEnabled -bool false

# Limit disk cache size
defaults write org.chromium.Chromium DiskCacheSize -integer 10485760
defaults write org.chromium.Chromium MediaCacheSize -integer 10485760

# Network prediction options;
# 2: Do not predict network actions on any network connection
defaults write org.chromium.Chromium NetworkPredictionOptions -integer 2

# Don't share with Google (generally not necessary, as we're running custom builds, but added for completeness)
defaults write org.chromium.Chromium SafeBrowsingProtectionLevel -integer 0
defaults write org.chromium.Chromium SafeBrowsingExtendedReportingEnabled -bool false
defaults write org.chromium.Chromium MetricsReportingEnabled -bool false
defaults write org.chromium.Chromium PasswordLeakDetectionEnabled -bool false
defaults write org.chromium.Chromium SyncDisabled -bool true
defaults write org.chromium.Chromium SpellCheckServiceEnabled -bool false
defaults write org.chromium.Chromium CloudPrintSubmitEnabled -bool false
defaults write org.chromium.Chromium DataCompressionProxyEnabled -bool false
defaults write org.chromium.Chromium BrowserNetworkTimeQueriesEnabled -bool false

# Disable Sign-in with Chrome
defaults write org.chromium.Chromium BrowserSignin -int 0
# Disable translations
defaults write org.chromium.Chromium TranslateEnabled -bool false

# Force-disable hiding parts of the URL in the address bar
defaults write org.chromium.Chromium ShowFullUrlsInAddressBar -bool true
