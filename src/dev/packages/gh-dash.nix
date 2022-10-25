{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:

buildGoModule rec {
  pname = "gh-dash";
  version = "3.4.2";

  src = fetchFromGitHub {
    owner = "dlvhdr";
    repo = "gh-dash";
    rev = "v${version}";
    sha256 = "sha256-MiVscWYq2Y9EaupSYbTA9bsToLoIVhHCNE2Kj0GpkPw=";
  };

  vendorSha256 = "sha256-BbrHvphTQLvUKanmO4GrNpkT0MSlY7+WMJiyXV7dFB8=";

  subPackages = [ "." ];

  meta = with lib; {
    homepage = "https://github.com/dlvhdr/gh-dash";
    description = "A beautiful CLI dashboard for GitHub";
    license = licenses.mit;
  };
}
