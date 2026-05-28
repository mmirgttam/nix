# Home Manager

## Bootstrap

### Install Nix

On macOS:

```sh
curl -sSf -L https://install.lix.systems/lix | sh -s -- install
```

On Linux:

```sh
curl -sSf -L https://nixos.org/nix/install | sh -s -- --daemon
```

### Enable flakes

```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Clone config

```sh
git clone https://github.com/mmirgttam/nix.git ~/.config/home-manager
```

### Apply config

On macOS:

```sh
nix run home-manager -- switch --flake ~/.config/home-manager#matt-aarch64-darwin
```

On Linux:

```sh
nix run home-manager -- switch --flake ~/.config/home-manager#matt-x86_64-linux
```

## References

* [NixOS Packages](https://search.nixos.org/packages?channel=unstable)
* [Home Manager Option Search](https://home-manager-options.extranix.com)
