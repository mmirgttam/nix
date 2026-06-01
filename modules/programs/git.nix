{ pkgs, ... }: {
  home.packages = [ pkgs.git-lfs ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Matt Grimm";
        email = "matt.t.grimm@gmail.com";
      };

      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      pull.ff = "only";

      push = {
        default = "current";
        autoSetupRemote = true;
      };

      credential.helper = "cache --timeout=86400";

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      init.defaultBranch = "main";

      diff = {
        tool = "nvimdiff";
        algorithm = "histogram";
        colorMoved = "plain";
        renames = true;
      };

      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      help.autocorrect = "prompt";
      commit.verbose = true;
      log.date = "iso";

      filter."lfs" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };

      aliases = {
        co = "checkout";
        ci = "commit";
        cl = "clone";
        st = "status";
        br = "branch";
        fe = "fetch";
      };
    };
  };
}
