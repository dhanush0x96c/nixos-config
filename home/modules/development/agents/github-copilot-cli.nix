_:

{
  programs.github-copilot-cli = {
    enable = true;
    skills = import ./skills;
  };
}
