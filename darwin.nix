{ pkgs, ... }: {
  # nix-darwin のバージョン管理に必須
  system.stateVersion = 6;

  # nixpkgs のホストプラットフォーム指定
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Determinate Nix を使用しているため nix-darwin の Nix 管理を無効化
  nix.enable = false;

  # home-manager の統合に必要なユーザー定義
  users.users.nt = {
    name = "nt";
    home = "/Users/nt";
  };
}
