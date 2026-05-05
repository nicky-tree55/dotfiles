{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        anthropic.claude-code
      ];

      userSettings = {
        "editor.formatOnSave" = true;
        "editor.fontSize" = 14;
        "editor.tabSize" = 2;
        "editor.rulers" = [ 80 120 ];
        "editor.minimap.enabled" = false;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "terminal.integrated.fontSize" = 13;
        "workbench.colorTheme" = "Default Dark Modern";
      };
    };
  };
}
