{ pkgs, username, homeDirectory, gitName, gitEmail, ... }: {
  imports = [
    ./modules/home/git.nix
    ./modules/home/git-hooks.nix
    ./modules/home/zsh.nix
    ./modules/home/vscode.nix
    ./modules/home/zed.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;

  # home-manager 自身を home-manager で管理する
  programs.home-manager.enable = true;

  # 初回設定時のバージョンから変えないこと
  home.stateVersion = "24.11";
}
