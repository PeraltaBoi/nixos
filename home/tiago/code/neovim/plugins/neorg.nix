{ ... }:

{
  programs.nixvim = {
    plugins.neorg = {
      enable = true;
      telescopeIntegration.enable = true;
      settings = {
        load = {
          "core.defaults" = { __empty = null; };
          "core.concealer" = { __empty = null; };
          "core.dirman" = {
            config = {
              workspaces = { notes = "~/notes"; };
              default_workspace = "notes";
            };
          };
        };
      };
    };
  };
}

