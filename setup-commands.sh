#################
##   INSTALL   ##
#################

MACHINE="$1"

cd "$HOME" || exit

# Install nix (https://github.com/DeterminateSystems/nix-installer)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Clone repo
nix run nixpkgs#git -- clone https://github.com/rasmus-kirk/nix-config.git .system-configuration

# Enter cloned repo
cd .system-configuration || exit

# Install configuration using flakes
nix run home-manager/master -- switch -b backup --flake .#"$MACHINE"
