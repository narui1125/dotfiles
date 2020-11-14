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