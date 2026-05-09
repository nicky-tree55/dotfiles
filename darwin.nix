{ pkgs, ... }: {
  imports = [
    ./modules/darwin/fonts.nix
    ./modules/darwin/packages.nix
  ];

  # nix-darwin のバージョン管理に必須
  system.stateVersion = 6;

  # nixpkgs のホストプラットフォーム指定
  nixpkgs.hostPlatform = "aarch64-darwin";

  # unfree パッケージ（VSCode 等）を許可
  nixpkgs.config.allowUnfree = true;

  # Determinate Nix を使用しているため nix-darwin の Nix 管理を無効化
  nix.enable = false;

  # homebrew 等のプライマリユーザー設定
  system.primaryUser = "nt";

  # home-manager の統合に必要なユーザー定義
  users.users.nt = {
    name = "nt";
    home = "/Users/nt";
  };
}
