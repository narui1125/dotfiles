# Configure for Darwin

if [ "$(uname)" != "Darwin" ]; then
    return
fi

# ===== General =====

# タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# TouchBarカスタマイズ
defaults write com.apple.controlstrip MiniCustomized -array "com.apple.system.mission-control" "com.apple.system.launchpad" "com.apple.system.brightness" "com.apple.system.volume"

# Dockを左に表示
defaults write com.apple.dock orientation -string "left"

# ネットワークディスクとUSBディスクで.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# スクリーンショットで影を表示しない
defaults write com.apple.screencapture disable-shadow -bool true

# ===== Keyboard =====

# ライブ変換をオフ
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -int 0

# タイプミスを修正しない
defaults write com.apple.inputmethod.Kotoeri JIMPrefAutocorrectionKey -int 0

# ドルキーでバックスラッシュを入力
defaults write com.apple.inputmethod.Kotoeri JIMPrefCharacterForYenKey -int 1


# ===== Finder =====

# 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 名前で並べ替えている時はディレクトリを前に置く
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# デフォルトでリスト表示
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

# デフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# タグを表示しない
defaults write com.apple.finder ShowRecentTags -bool false


# ===== Safari =====

# ダウンロード後に自動でファイルを開かない
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false 

# 開発者ツールを有効化
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true