{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # CLI ユーティリティ
    ripgrep   # 高速 grep
    jq        # JSON プロセッサ
    gh        # GitHub CLI
    claude-code
    github-copilot-cli
  ];
}
