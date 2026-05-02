{ pkgs, ... }: {
  # nix-darwin のバージョン管理に必須
  system.stateVersion = 6;

  # nixpkgs のホストプラットフォーム指定
  nixpkgs.hostPlatform = "aarch64-darwin";
}
