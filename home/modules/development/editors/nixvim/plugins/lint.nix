_:

{
  plugins.lint = {
    enable = true;

    autoCmd = {
      event = [
        "BufEnter"
        "BufWritePost"
        "InsertLeave"
      ];
    };
  };
}
