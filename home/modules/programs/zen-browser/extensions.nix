{ pkgs, ... }:

{
  programs.zen-browser.profiles.default.extensions = {
    packages = with pkgs.nur.repos.rycee.firefox-addons; [
      (buildFirefoxXpiAddon {
        pname = "adguard-adblocker";
        version = "5.4.3.1";
        addonId = "adguardadblocker@adguard.com";
        url = "https://addons.mozilla.org/firefox/downloads/file/4805625/adguard_adblocker-5.4.3.1.xpi";
        sha256 = "1rqp8qcc0p6qgqfgpshiqnll5mrl9jyfnks4zygzim436k0k781l";
        meta = { };
      })
      (buildFirefoxXpiAddon {
        pname = "chess-com-keyboard";
        version = "6.6.0";
        addonId = "{d4ad10df-2c4a-4d87-a75b-bd2daefd1027}";
        url = "https://addons.mozilla.org/firefox/downloads/file/4513925/chess_com_keyboard-6.6.0.xpi";
        sha256 = "01ypgkgcjhpqnfjr7nv2r16zxjr7cfas6m4vf6rmmnbkvjfyzpyz";
        meta = { };
      })
      enhancer-for-youtube
      keepassxc-browser
      languagetool
      proton-vpn
      video-downloadhelper
      tampermonkey
      react-devtools
    ];
  };
}
