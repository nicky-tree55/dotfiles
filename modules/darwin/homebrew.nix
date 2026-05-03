{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      # darwin-rebuild switch 時に Homebrew を自動更新する
      autoUpdate = true;
      # Nix で管理されなくなった Cask を自動削除する
      cleanup = "zap";
    };

    # nixpkgs に存在しない GUI アプリを Homebrew Cask で管理する
    casks = [
      "arc"                  # ブラウザ
      "clipy"                # クリップボード履歴
      "cmd-eikana"           # 英かな（キーボード入力切り替え）
      "google-japanese-ime"  # Google 日本語入力
    ];
  };
}
