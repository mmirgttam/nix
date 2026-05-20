{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
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
