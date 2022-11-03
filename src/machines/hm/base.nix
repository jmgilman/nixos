{ pkgs, ... }:
{
  home.stateVersion = "22.05";

  # Base packages
  home.packages = with pkgs; [
    any-nix-shell
    bat-extras.batman
    bat-extras.batgrep
    bat-extras.batdiff
    bat-extras.batwatch
    bat-extras.prettybat
    bottom
    broot
    dasel
    diffoscope
    dig
    exa
    fd
    fzf
    gopass
    helix
    jc
    jq
    magic-wormhole
    pure-prompt
    ripgrep
    tldr
    vim
    yj
    yq-go
  ];

  # Enable direnv with nix support
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  # Enable bat
  programs.bat = {
    enable = true;
    config = {
      theme = "dracula";
    };
  };

  # Enable tmux
  programs.tmux = {
    enable = true;

    prefix = "C-a";
    baseIndex = 1;
    terminal = "screen-256color";

    extraConfig = ''
      bind m set-window-option main-pane-height 60\; select-layout main-horizontal
    '';

    tmuxp.enable = true;
  };

  # zsh configuration
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "fzf"
      ];
      theme = "";
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      brg = "batgrep";
      cat = "bat --paging=never";
      count = "find . -type f | wc -l";
      ct = "column -t";
      da = "direnv allow";
      dr = "direnv reload";
      g = "git";
      gpb = ''git push origin "$(git rev-parse --abbrev-ref HEAD)"'';
      left = "ls -t -1";
      ls = "exa";
      ll = "exa -la";
      lt = "exa --tree";
      mount = "mount | grep -E ^/dev | column -t";
      now = ''date +"%T"'';
      nr = "sudo nixos-rebuild switch --flake ~/code/nixos#Office && source ~/.zshrc";
      ports = "sudo lsof -iTCP -sTCP:LISTEN -n -P";
      t = "tmux";
      ta = "tmux attach";
      tl = "tmux ls";
      today = ''date +"%d-%m-%Y"'';
      tree = "broot";
      vi = "vim";
    };

    plugins = [
      {
        name = "you-should-use";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-you-should-use";
          rev = "1.7.3";
          sha256 = "/uVFyplnlg9mETMi7myIndO6IG7Wr9M7xDFfY1pG5Lc=";
        };
      }
    ];

    # Extra environment variables
    envExtra = ''
      rcode() {
        for proj in "$@"; do
            proj=$(realpath $proj)
            ssh office code --folder-uri "vscode-remote://ssh-remote+work$proj"
        done
      }
    '';

    # Extra content for .envrc
    initExtra = ''
      # Setup pure
      fpath+=${pkgs.pure-prompt}/share/zsh/site-functions
      autoload -U promptinit; promptinit
      prompt pure
      zstyle :prompt:pure:path color green

      # Configure any-nix-shell
      any-nix-shell zsh --info-right | source /dev/stdin
    '';
  };
}
