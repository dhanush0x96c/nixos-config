_:

{
  programs.zen-browser.profiles.default.settings = {
    "extensions.autoDisableScopes" = 0;
    "zen.view.sidebar-expanded" = false;
    "zen.tab-bar.expanded" = false;
    "zen.tabs.vertical.expand-on-hover" = true;

    # Firefox AI Chat
    "browser.ml.enable" = true;
    "browser.ml.chat.enabled" = true;
    "browser.ml.chat.provider" = "https://chatgpt.com";
    "browser.ml.chat.sidebar" = true;
    "browser.ml.chat.shortcuts" = true;
    "browser.ml.chat.shortcuts.custom" = true;
    "browser.ml.chat.menu" = true;
    "browser.ml.chat.page" = true;

    # Extension Updates & Notifications
    "extensions.update.enabled" = false;
    "extensions.update.autoUpdateDefault" = false;
    "extensions.update.notifyUser" = false;

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
