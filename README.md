# Home Manager

## Bootstrap

### Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://nixos.org/nix/install | sh -s -- --daemon
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

```sh
nix run home-manager -- switch --flake ~/.config/home-manager#matt
```
