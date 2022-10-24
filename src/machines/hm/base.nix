{ pkgs, ... }:
{
  home.stateVersion = "22.05";

  # Base packages
  home.packages = with pkgs; [
    any-nix-shell
    autojump
    bat
    bat-extras.batman
    bat-extras.batgrep
    bat-extras.batdiff
    bat-extras.batwatch
    bat-extras.prettybat
    diff-so-fancy
    fd
    fzf
    jq
    pure-prompt
    ripgrep
    tldr
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
      gbc = "git checkut -b ";
      gpb = ''git push origin "$(git rev-parse --abbrev-ref HEAD)"'';
      left = "ls -t -1";
      ll = "ls -la";
      lt = "du -sh * | sort -h";
      mount = "mount | grep -E ^/dev | column -t";
      now = ''date +"%T"'';
      ports = "sudo lsof -iTCP -sTCP:LISTEN -n -P";
      today = ''date +"%d-%m-%Y"'';
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
      function aws-switch() {
        case ''${1} in
            "")
            clear)
                export AWS_PROFILE=""
                ;;
            *)
                export AWS_PROFILE="''${1}"
                ;;
        esac
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

      # Configure autojump
      source ${pkgs.autojump}/share/zsh/site-functions/autojump.zsh
    '';
  };
}
