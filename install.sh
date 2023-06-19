#!/bin/bash

#Enable Flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

#Build my home-manager packages
nix build github:mjpc13/dotfiles?dir=nix/home-manager#homeConfigurations.mjpc13.activationPackage

~/result/activate

#Create configs symlinks
ln -s ~/dotfiles/nvim ~/.config/


home-manager switch --impure --flake ~/dotfiles/nix/home-manager#mjpc13
