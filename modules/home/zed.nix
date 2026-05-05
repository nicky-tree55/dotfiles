{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];

    userSettings = {
      theme = "Ayu Dark";
      git_status = true;
      ui_font_size = 16;
      buffer_font_size = 15;
      buffer_font_family = "JetBrains Mono";
      buffer_font_fallbacks = [ "Noto Sans JP" ];
      buffer_font_weight = 400;
      buffer_line_height = "comfortable";
      format_on_save = "on";
      tab_size = 2;
      soft_wrap = "editor_width";
      vim_mode = false;

      terminal = {
        font_size = 13;
      };
    };
  };
}
