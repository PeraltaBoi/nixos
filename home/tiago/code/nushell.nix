{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    settings = {
      completions = { };
      show_banner = false;
    };
    environmentVariables = {
      EDITOR = "hx";
      JAVA_HOME = "${pkgs.jdk25}";
      STEEL_HOME = "${config.xdg.dataHome}/steel";
      STEEL_LSP_HOME = "${config.xdg.dataHome}/steel/lsp";
    };
    extraConfig = ''
      nitch
      let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans | from json
      }

      let zoxide_completer = {|spans|
        $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
      }

      let multiple_completers = {|spans|
        # if the current command is an alias, get it's expansion
        let expanded_alias = (scope aliases | where name == $spans.0 | get --optional 0 | get --optional expansion)

        # overwrite
        let spans = (if $expanded_alias != null  {
            # put the first word of the expanded alias first in the span
            $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
        } else { $spans })
        
        match $spans.0 {
            z | zi => $zoxide_completer
            __zoxide_z | __zoxide_zi => $zoxide_completer
            _ => $carapace_completer
        } | do $in $spans
      }

      $env.PATH = $env.PATH ++ ['/home/tiago/.cargo/bin']
    '';
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = { };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    # options = [ "--cmd cd" ];
  };
}
