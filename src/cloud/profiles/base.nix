{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    awscli2
    aws-vault
    google-cloud-sdk
    kubectl
    kubernetes-helm
  ];
}
