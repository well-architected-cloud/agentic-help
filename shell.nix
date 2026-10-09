let
  pkgs = import <nixpkgs> { };

  moth = (builtins.getFlake "github:tailoredshapes/moth")
        .packages.${pkgs.system}.default;

in pkgs.mkShellNoCC {
 
    buildInputs = [
      
      pkgs.chromium
	  pkgs.nodejs_25
      pkgs.drawio
      pkgs.shellcheck
	  
      moth
   ];
 }


