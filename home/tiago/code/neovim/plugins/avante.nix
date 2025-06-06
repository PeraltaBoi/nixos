{ ... }:

{
  programs.nixvim = {
    plugins.avante = {
      enable = true;
      settings = {
        provider = "copilot";
        # copilot = { model = "claude-3.5-sonnet"; };
        copilot = {
          model = "claude-3.7-sonnet-thought";
          disable_tools = true;
        };
        # copilot = { model = "claude-sonnet-4"; };
      };
    };
    plugins.render-markdown = {
      enable = true;
      settings = { file_types = [ "Avante" ]; };
    };
  };
}
