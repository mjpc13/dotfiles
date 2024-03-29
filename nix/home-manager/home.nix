{ config
, pkgs
, ...
}: {
  home = {
    homeDirectory = "/home/mjpc13";

    packages = with pkgs; [
      #Dev tools
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      bash
      bat
      bottom
      cachix
      fd
      lazydocker
      lazygit
      navi
      ncdu
      neofetch
      ranger
      ripgrep
      ripgrep-all
      thefuck
      tldr
      wget
      xclip
      zsh

      #Utility Apps
      betterbird
      ffmpeg
      gimp
      slack

      #Programming languages
      cargo
      go
      julia
      nodePackages.pnpm
      nodejs
      rustc

      #Fixes
      nixgl.auto.nixGLDefault #Fixes OpenGL problems on Non-NixOS distros


      #Packages not worth it
      # docker does not work well, need to check it

    ];

    stateVersion = "22.11";
    username = "mjpc13";

  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  fonts.fontconfig.enable = true;


  programs = {
    home-manager.enable = true;
    bash.enable = true;

    kitty = {
      enable = true;
      font.name = "FiraCode";
      font.size = 13;
      theme = "Gruvbox Dark";
    };

    zsh = {
      enable = true;
      enableCompletion = true; # enabled in oh-my-zsh
      shellAliases = {
        please = "sudo";
        hms = "home-manager switch --impure --flake ~/dotfiles/nix/home-manager#mjpc13";
        hmu = "nix flake update ~/dotfiles/nix/home-manager && hms";
        hml = "home-manager generations";
        hmd = "nix store diff-closures";
      };

      oh-my-zsh = {
        enable = true;
        #plugins = [ "zsh-autosuggestions" "zsh-syntax-highlighting"];
        theme = "robbyrussell";
      };
    };

    git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      userName = "Mario Cristovao";
      userEmail = "mjpc13@protonmail.com.com";
      extraConfig = {
        core.editor = "nvim";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withPython3 = true;

      #Maybe in the future I'll use the plugins from here.
      plugins = with pkgs.vimPlugins; [
        # comment-nvim
        # coq-artifacts
        # coq_nvim
        # gitsigns-nvim
        # gruvbox-nvim A theme i think
        # leap-nvim
        # lsp-status-nvim
        # lsp_extensions-nvim
        # lspkind-nvim
        # nvim-colorizer-lua
        # nvim-lspconfig
        # nvim-tree-lua
        # nvim-treesitter
        # nvim-treesitter-endwise
        # nvim-treesitter.withAllGrammars
        # ros-nvim
        # telescope-fzy-native-nvim
        # telescope-nvim
        # telescope-symbols-nvim
        # telescope-ui-select-nvim
        # vim-repeat
        # vimtex
        # which-key-nvim
      ];
      # only loaded when neovim is launched!
      #  extraPackages = with pkgs; [
      # lsp
      #cmake-language-server
      #docker-ls
      #kotlin-language-server
      #nodePackages.bash-language-server
      #nodePackages.vscode-langservers-extracted
      #nodePackages.yaml-language-server
      #pyright
      #rust-analyzer
      #sumneko-lua-language-server
      #texlab
      #gopls

      # formatters
      #black
      #nixpkgs-fmt
      #rustfmt
      #  ];

    };

  };



}
