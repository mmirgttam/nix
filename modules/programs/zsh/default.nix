{ config, ... }:
let
  hm = config.matt.home-manager;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initContent = builtins.readFile ./functions.zsh;

    envExtra = ''
      if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/nix.sh"
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
