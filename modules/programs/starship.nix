{ ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      line_break.disabled = false;
      gcloud.disabled = true;
      hostname.ssh_only = true;
      username.show_always = false;
    };
  };
}
