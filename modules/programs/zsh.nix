{ config, lib, ... }:
let
  hm = config.matt.home-manager;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = ''
      if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/nix.sh"
      fi
    '';
    shellAliases = {
      cd = "z";
      ncdu = "ncdu --color dark";
      vi = "nvim";
      vim = "nvim";
    } // lib.optionalAttrs (hm.switchConfiguration != null) {
      hms = "home-manager switch --flake ~/.config/home-manager#${hm.switchConfiguration}";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "fzf" "git" ];
    };
  };
}
