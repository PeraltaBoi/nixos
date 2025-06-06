{ ... }:

{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      defaults = { path_display = [ "truncate" ]; };
      extensions = {
        fzf-native.enable = true;
        frecency.enable = true;
        ui-select.enable = true;
        media-files.enable = true;
        project.enable = true;
        undo.enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>sf";
        options.silent = true;
        action = "<CMD>Telescope find_files<CR>";
        options = { desc = "[S]earch [F]iles"; };
      }
      {
        mode = "n";
        key = "<leader>sg";
        options.silent = true;
        action = "<CMD>Telescope live_grep<CR>";
        options = { desc = "[S]earch by [G]rep"; };
      }
      {
        mode = "n";
        key = "<leader><leader>";
        options.silent = true;
        action = "<CMD>Telescope frecency<CR>";
        options = { desc = "[S]earch [R]ecent files"; };
      }
      # {
      #   mode = "n";
      #   key = "<leader>sr";
      #   options.silent = true;
      #   action = "<CMD>Telescope frecency<CR>";
      #   options = { desc = "[S]earch [R]ecent files"; };
      # }
      {
        mode = "n";
        key = "<leader>sp";
        options.silent = true;
        action = "<CMD>Telescope project<CR>";
        options = { desc = "[S]earch [P]rojects"; };
      }
      {
        mode = "n";
        key = "<leader>su";
        options.silent = true;
        action = "<CMD>Telescope undo<CR>";
        options = { desc = "[S]earch [U]ndo tree"; };
      }
      {
        mode = "n";
        key = "<leader>sm";
        options.silent = true;
        action = "<CMD>Telescope media_files<CR>";
        options = { desc = "[S]earch [M]edia files"; };
      }
      {
        mode = "n";
        key = "<leader>sb";
        options.silent = true;
        action = "<CMD>Telescope buffers<CR>";
        options = { desc = "[S]earch [B]uffers"; };
      }
      {
        mode = "n";
        key = "<leader>sh";
        options.silent = true;
        action = "<CMD>Telescope help_tags<CR>";
        options = { desc = "[S]earch [H]elp"; };
      }
      {
        mode = "n";
        key = "<leader>sw";
        options.silent = true;
        action = "<CMD>Telescope grep_string<CR>";
        options = { desc = "[S]earch current [W]ord"; };
      }
      {
        mode = "n";
        key = "<leader>sd";
        options.silent = true;
        action = "<CMD>Telescope diagnostics<CR>";
        options = { desc = "[S]earch [D]iagnostics"; };
      }
    ];
  };
}
