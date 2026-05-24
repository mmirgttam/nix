{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = ''
      if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/nix.sh"
      fi
    '';
    shellAliases = {
      bazel = "bazelisk";
      cd = "zoxide";
      hms = "home-manager switch";
      vi = "nvim";
      vim = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "bazel" "fzf" "git" ];
    };
  };
}
