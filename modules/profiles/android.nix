{ pkgs, ... }:
let
  unfreePkgs = import pkgs.path {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      android_sdk.accept_license = true;
      allowUnfree = true;
    };
  };
in {
  home.packages = (with pkgs; [
    apksigner
    apktool
    jadx
    wireshark
  ]) ++ (with unfreePkgs; [
    android-studio
  ]);
}
