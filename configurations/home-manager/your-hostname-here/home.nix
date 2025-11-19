# My home manager config
{
  pkgs,
  config,
  ...
}: let
  configDir = "${config.home.homeDirectory}/.system-configuration";
  username = "your-username-here";
  machine = "your-hostname-here";
in {
  myModules = {
    homeManagerScripts = {
      enable = true;
      extraNixOptions = true;
      configDir = configDir;
      machine = machine;
    };
  };

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable this for better compatibility with non-nixos systems
  targets.genericLinux.enable = true;

  # Enable services like so:
  services = {
    # syncthing.enable = true;
    # podman.enable = true;
  };

  # This code block would enable direnv
  programs.direnv = {
    # enable = true;
    # enableBashIntegration = true;
    # enableZshIntegration = true;
    # nix-direnv.enable = true;
    # silent = true;
  };

  # List of packages to install
  home.packages = with pkgs; [
    firefox
    # signal-desktop-bin
  ];

  # Don't touch this, it pins the default option values
  home.stateVersion = "22.11";
}
