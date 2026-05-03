{ pkgs, ... }: {
  # nix-darwin のバージョン管理に必須
  system.stateVersion = 6;

  # nixpkgs のホストプラットフォーム指定
  nixpkgs.hostPlatform = "aarch64-darwin";

  # home-manager の統合に必要なユーザー定義
  users.users.nt = {
    name = "nt";
    home = "/Users/nt";
  };
}
