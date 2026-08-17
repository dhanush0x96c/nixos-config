{ ... }:

{
  programs.zen-browser.profiles.default.settings = {
    "extensions.autoDisableScopes" = 0;
    "zen.view.sidebar-expanded" = false;
    "zen.tab-bar.expanded" = false;
    "zen.tabs.vertical.expand-on-hover" = true;

    # Password Manager & Autofill
    "signon.rememberSignons" = false;
    "signon.autofillForms" = false;
    "signon.generation.enabled" = false;
    "signon.management.page.fileImport.enabled" = false;
    "signon.suggestImport" = false;
    "extensions.formautofill.addresses.enabled" = false;
    "extensions.formautofill.creditCards.enabled" = false;
  };
}
