{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;

    userSettings = {
      theme = "One Dark";
      ui_font_size = 16;
      buffer_font_size = 14;
      buffer_font_family = "JetBrains Mono";
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
