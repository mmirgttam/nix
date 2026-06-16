{ lib, ... }:
let
  # Key mapping overrides.
  # Use https://hidutil-generator.netlify.app to find key codes.
  keyMappings = builtins.toJSON {
    UserKeyMapping = [
      # Caps Lock -> Escape
      {
        HIDKeyboardModifierMappingSrc = 30064771129; # 0x700000039
        HIDKeyboardModifierMappingDst = 30064771113; # 0x700000029
      }
    ];
  };
in {
  home.sessionVariables = {
    WEZTERM_SHELL_SKIP_USER_VARS = "1";
    WEZTERM_SHELL_SKIP_CWD = "1";
  };

  targets.darwin.defaults."com.apple.dock".autohide = true;
  targets.darwin.defaults."com.apple.menuextra.clock".Show24Hour = true;

  # Apply immediately when Home Manager switches, and again at login, since this
  # is not preserved across reboots.
  home.activation.keyMappings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    /usr/bin/hidutil property --set '${keyMappings}' || true
  '';

  launchd.agents.keyboard-mapping.config = {
    ProgramArguments = [ "/usr/bin/hidutil" "property" "--set" keyMappings ];
    RunAtLoad = true;
  };

  matt.home-manager.switchConfiguration = lib.mkDefault "matt-aarch64-darwin";
}
