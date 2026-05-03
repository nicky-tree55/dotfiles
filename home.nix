{ pkgs, username, homeDirectory, gitName, gitEmail, ... }: {
  home.username = username;
  home.homeDirectory = homeDirectory;

  # home-manager 自身を home-manager で管理する
  programs.home-manager.enable = true;

  # 初回設定時のバージョンから変えないこと
  home.stateVersion = "24.11";
}
