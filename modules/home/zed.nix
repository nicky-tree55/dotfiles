{ pkgs, nix-claude-code, ... }: {

  home.packages = [
    # claude-codeはghも同梱されたデフォルト版を使う
    nix-claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];

    userSettings = {
      theme = "Ayu Dark";
      git_status = true;
      ui_font_size = 15;
      buffer_font_size = 13;
      buffer_font_family = "GeistMono Nerd Font";
      buffer_font_weight = 400;
      buffer_font_features = { calt = false; };
      buffer_line_height = "comfortable";
      format_on_save = "on";
      tab_size = 2;
      soft_wrap = "editor_width";
      vim_mode = false;

      terminal = {
        font_family = "GeistMono Nerd Font";
        font_size = 12;
        shell = {
          program = "/bin/zsh";
          args = [ "-l" ];
        };
      };
    };
  };
}
