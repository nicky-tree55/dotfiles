{ gitName, gitEmail, ... }: {
  programs.git = {
    enable = true;
    signing.format = "openpgp";

    settings = {
      user = {
        name = gitName;
        email = gitEmail;
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      merge.conflictstyle = "zdiff3";
      diff.algorithm = "histogram";
    };
  };
}
