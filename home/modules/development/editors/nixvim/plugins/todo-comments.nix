{ ... }:

{
  plugins.todo-comments.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "]t";
      action = "<cmd>lua require(\"todo-comments\").jump_next()<cr>";
      options.desc = "Next Todo Comment";
    }
    {
      mode = "n";
      key = "[t";
      action = "<cmd>lua require(\"todo-comments\").jump_prev()<cr>";
      options.desc = "Previous Todo Comment";
    }
    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>lua Snacks.picker.todo_comments()<cr>";
      options.desc = "Todo";
    }
    {
      mode = "n";
      key = "<leader>sT";
      action = ''<cmd>lua Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })<cr>'';
      options.desc = "Todo/Fix/Fixme";
    }
  ];
}
