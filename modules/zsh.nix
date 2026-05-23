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
      hms = "home-manager switch";
      lg = "lazygit";
      vi = "nvim";
      vim = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "bazel" "fzf" "git" ];
    };
  };
}
