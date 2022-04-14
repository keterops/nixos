{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "keterops";
    userEmail = "zaaain@protonmail.com";
    signing = {
      key = "14F7FE1448AE1991";
      signByDefault = true;
    };
    extraConfig = {
      url = {
        "git://github.com/" = { insteadOf = "github:"; };
        "git@github.com:" = {
          insteadOf = "gh:";
          pushInsteadOf = [ "github:" "git://github.com/" ];
        };
      };
    };
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [ jnoortheen.nix-ide ];
    userSettings = { "nix.enableLanguageServer" = true; };
  };

  home.packages = with pkgs; [
    ungoogled-chromium
    mpv
    gnome.nautilus
    gnome.sushi
    feh
    uxterm
    nixfmt
  ];
  programs.home-manager.enable = true;
}
