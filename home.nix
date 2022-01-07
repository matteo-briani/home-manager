{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [

   # Command Line
   pkgs.neovim
   pkgs.jq
   pkgs.ripgrep
   pkgs.git
   pkgs.fish
   pkgs.curl
   pkgs.nmap
   pkgs.tldr
   pkgs.fd
   pkgs.ctags
   pkgs.tmux

   pkgs.python3
   pkgs.cargo
   pkgs.rustc
   pkgs.rustfmt
   pkgs.rust-analyzer
   pkgs.clippy
   pkgs.pkg-config

   # Wayland
   pkgs.grim  
   pkgs.slurp  

   # Common dev library
   pkgs.openssl.dev  
   # pkgs.openssl  
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "spalla";
  home.homeDirectory = "/home/spalla";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  programs.fish = {
    enable = true;
    /* shellInit = "set -U fish_user_paths $fish_user_paths /home/spalla/.nix-profile/bin/;set -U fish_user_paths $fish_user_paths /opt/aws-vault/;set -x EDITOR nvim; bass /home/spalla/.nix-profile/etc/profile.d/nix.sh"; */
    shellInit = "bass /home/spalla/.nix-profile/etc/profile.d/nix.sh";
  };
  programs.fish.plugins = [
    {
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
        sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";   
      };
    }
    {
      name = "bass";
      src = pkgs.fetchFromGitHub {
        owner = "edc";
        repo = "bass";
        rev = "7aae6a85c24660422ea3f3f4629bb4a8d30df3ba";
        sha256 = "03693ywczzr46dgpnbawcfv02v5l143dqlz1fzjbhpwwc2xpr42y";   
      };
    }
    {
      name = "fish-kubectl-completions";
      src = pkgs.fetchFromGitHub {
        owner = "evanlucas";
        repo = "fish-kubectl-completions";
        rev = "ced676392575d618d8b80b3895cdc3159be3f628";
        sha256 = "09qcj82qfs4y4nfwvy90y10xmx6vc9yp33nmyk1mpvx0dx6ri21r";   
      };
    }
    {
      name = "theme-bobthefish";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "theme-bobthefish";
        rev = "626bd39b002535d69e56adba5b58a1060cfb6d7b";
        sha256 = "06whihwk7cpyi3bxvvh3qqbd5560rknm88psrajvj7308slf0jfd";   
      };
    }
  ];
}
