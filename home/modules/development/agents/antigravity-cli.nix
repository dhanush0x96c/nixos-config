_:

{
  programs.antigravity-cli = {
    enable = true;
    skills = import ./skills;

    permissions = {
      allow = [
        # Common read and search commands
        "command(cat)"
        "command(fd)"
        "command(find)"
        "command(grep)"
        "command(ls)"
        "command(rg)"

        # Git read commands
        "command(git branch)"
        "command(git diff)"
        "command(git log)"
        "command(git show)"
        "command(git status)"

        # JJ (Jujutsu) read commands
        "command(jj bookmark list)"
        "command(jj diff)"
        "command(jj log)"
        "command(jj root)"
        "command(jj show)"
        "command(jj status)"
      ];
    };
  };
}
