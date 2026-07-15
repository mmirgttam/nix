{ config, ... }:
let
  hm = config.matt.home-manager;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";

    initContent = builtins.readFile ./functions.zsh;

    envExtra = ''
      if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      fi
    '';

    shellAliases = {
      cd = "z";
      glol = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\"";
      ncdu = "ncdu --color dark";
      vi = "nvim";
      vim = "nvim";
      hms = "home-manager switch --flake ~/.config/home-manager#${hm.switchConfiguration}";
    };
  };
}
