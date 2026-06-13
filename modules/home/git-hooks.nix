{ pkgs, homeDirectory, ... }:
let
  hooksDir = "${homeDirectory}/.config/git/hooks";

  preCommit = pkgs.writeShellScript "pre-commit-gitleaks" ''
    set -eu
    if ! command -v gitleaks >/dev/null 2>&1; then
      echo "gitleaks が見つかりません。pre-commit スキャンをスキップします。" >&2
      exit 0
    fi
    gitleaks protect --staged --redact --verbose
  '';
in {
  # 宣言的に pre-commit フックを配置し、全リポジトリ共通の hooksPath を指定する
  home.file.".config/git/hooks/pre-commit" = {
    source = preCommit;
    executable = true;
  };

  programs.git.settings.core.hooksPath = hooksDir;
}
