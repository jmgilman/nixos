{
  programs.zsh.envExtra = ''
    export AWS_VAULT_BACKEND=pass
    export AWS_VAULT_PASS_CMD=gopass
    export AWS_VAULT_PASS_PASSWORD_STORE_DIR=~/.local/share/gopass/stores/root
    export AWS_VAULT_PASS_PREFIX=aws-vault
  '';
}
