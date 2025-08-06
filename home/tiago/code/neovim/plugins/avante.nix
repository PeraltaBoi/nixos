{ ... }:

{
  programs.nixvim = {
    plugins.avante = {
      enable = true;
      settings = {
        mode = "legacy";
        provider = "copilot";
        # copilot = { model = "claude-3.5-sonnet"; };
        providers = {
          copilot = {
            # model = "claude-3.7-sonnet-thought";
            model = "gemini-2.5-pro";
            # disable_tools = true;
          };
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
