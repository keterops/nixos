{ pkgs, ... }: {
  home.packages = with pkgs; [ git nixfmt ungoogled-chromium feh mpv pantheon.elementary-files pantheon.elementary-photos pantheon.elementary-terminal nixfmt  ];
  programs.home-manager.enable = true;
  # programs.vscode = {
  #   enable = true;
  #   extensions = with pkgs.vscode-extensions; [
  #     jnoortheen.nix-ide
  #   ];
  # };
}