{ ... }: {
  system.defaults = {
    # Dock
    dock = {
      autohide = true;                 # Dock を自動的に隠す
      autohide-delay = 0.0;            # 表示遅延をなくす
      show-recents = false;            # 最近使ったアプリを非表示
      minimize-to-application = true;  # アプリアイコンにしまう
      tilesize = 48;                   # アイコンサイズ
    };

    # Finder
    finder = {
      AppleShowAllExtensions = true;   # 全拡張子を表示
      ShowPathbar = true;              # パスバーを表示
      ShowStatusBar = true;            # ステータスバーを表示
      FXPreferredViewStyle = "Nlsv";   # リスト表示をデフォルトに
      FXDefaultSearchScope = "SCcf";   # 検索スコープを現在のフォルダに
      _FXShowPosixPathInTitle = true;  # タイトルにフルパスを表示
    };

    # システム全体
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";                    # ダークモード
      AppleShowAllExtensions = true;                   # 全拡張子を表示
      NSAutomaticCapitalizationEnabled = false;        # 自動大文字化を無効化
      NSAutomaticSpellingCorrectionEnabled = false;    # 自動スペル修正を無効化
      NSAutomaticPeriodSubstitutionEnabled = false;    # ピリオド自動補完を無効化
      NSAutomaticQuoteSubstitutionEnabled = false;     # スマートクォートを無効化
      KeyRepeat = 2;           # キーリピート速度（小さいほど速い）
      InitialKeyRepeat = 15;   # キーリピート開始までの遅延
    };

    # トラックパッド
    trackpad = {
      Clicking = true;   # タップでクリック
    };

    # スクリーンショット
    screencapture = {
      location = "~/Desktop";
      type = "png";
    };
  };

  # postActivation スクリプトで壁紙を設定
  # 注意: 輝度自動調整・True Tone は macOS の保護領域のため手動で
  #       System Settings > Displays から設定してください
  system.activationScripts.postActivation.text = ''
    echo "Setting wallpaper..."
    sudo -u nt osascript -e 'tell application "System Events" to tell every desktop to set picture to "/System/Library/Desktop Pictures/Solid Colors/Black.png" as POSIX file' 2>/dev/null || true
    killall Dock 2>/dev/null || true
  '';
}

