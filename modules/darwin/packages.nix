{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # CLI ユーティリティ
    ripgrep   # 高速 grep
    fd        # 高速 find
    bat       # シンタックスハイライト付き cat
    eza       # モダンな ls
    fzf       # ファジーファインダー
    jq        # JSON プロセッサ
    gh        # GitHub CLI

    # GUI アプリ
    zed-editor  # コードエディタ
    rectangle   # ウィンドウ管理
  ];
}
