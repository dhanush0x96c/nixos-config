_:

{
  programs.zsh = {
    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";

    initContent = ''
      clear-screen() {
        zle .clear-screen
        if (( $+functions[omp_repaint_prompt] )); then
          omp_repaint_prompt
        fi
      }
      zle -N clear-screen
    '';

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      saveNoDups = true;
      share = true;
      save = 5000;
      size = 5000;
    };

    localVariables = {
      WORDCHARS = "";
    };
  };
}
