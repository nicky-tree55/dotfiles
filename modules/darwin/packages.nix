{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # CLI ユーティリティ
    ripgrep   # 高速 grep
    jq        # JSON プロセッサ
    gh        # GitHub CLI
    gitleaks  # シークレットスキャナ（pre-commit / CI で使用）
    claude-code
    github-copilot-cli
    zed-editor
  ];
}
