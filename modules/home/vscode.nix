{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        anthropic.claude-code
      ];

      userSettings = {
        "editor.formatOnSave" = true;
        "editor.fontFamily" = "GeistMono Nerd Font";
        "editor.fontSize" = 12;
        "editor.tabSize" = 2;
        "editor.rulers" = [ 80 120 ];
        "editor.minimap.enabled" = false;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "terminal.integrated.fontFamily" = "GeistMono Nerd Font";
        "terminal.integrated.fontSize" = 12;
        "workbench.colorTheme" = "Default Dark Modern";
        "workbench.startupEditor" = "none";
      };
    };
  };
}
