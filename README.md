# Home Manager Quickstart

## Why?

- This repo will get you started with Home Manager (non-nixos).
- It uses flakes.
- It has a single module, but the structure invites you to create your own modules.
- For inspiration on more complex configuration, check out my [nix config](https://github.com/rasmus-kirk/nix-config)

## Quickstart

If you haven't already, install Nix using the Determinate Nix installer:

```bash
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

To get started using Home Manager, you must fork this repo. Then clone it:

```bash
  cd ~
  git clone git@github.com:your-git-username/your-fork.git .system-configuration
```

The above will create the directory `~/.system-configuration` containing
your fork. You can call the directory anything you want. Now you just need
to change the following two stand-in values:

- "your-hostname-here"
- "your-username-here"

The "hostname" here is the name of the machine, examples:

- "laptop"
- "server"
- "steam-deck"
- "work-laptop"

You will find these variables in the following places:

- `/flake.nix` (49:7) ["your-hostname-here"]
- `/flake.nix` (58:41) ["your-hostname-here"]
- `/flake.nix` (58:41) ["your-hostname-here"]
- `/configurations/home-manager/your-hostname-here` (rename the directory)
- `/configurations/home-manager/your-hostname-here/home.nix` (8:15) ["your-username-here"]
- `/configurations/home-manager/your-hostname-here/home.nix` (9:14) ["your-hostname-here"]

Now you're ready to build your first iteration! Simply run:

```bash
  nix run home-manager/master -- switch -b backup --flake .#your-hostname-here
```

Again, replacing `your-hostname-here`. This will install your new Home
Manager configuration! To customize your configuration, edit the file
`configurations/home-manager/your-hostname-here/home.nix` and use the provided
wrapper tool `hm` from `myModules`. The important commands are:

- `hm rebuild`: Run this after changing your config, and you want to apply the changes.
- `hm upgrade`: Run this to update all Home Manager packages.

For a full list of commands, run `hm` without any arguments. To
see what `hm` does under the hood, check out the bash script in
`modules/home-manager/homeManagerScripts/default.nix`.
