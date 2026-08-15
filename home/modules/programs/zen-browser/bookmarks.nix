{ ... }:

{
  programs.zen-browser.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "ChatGPT";
        url = "https://chatgpt.com/";
      }
      {
        name = "Gemini";
        url = "https://gemini.google.com/";
      }
      {
        name = "Claude";
        url = "https://claude.ai/";
      }
      {
        name = "Perplexity";
        url = "https://www.perplexity.ai/";
      }
      {
        name = "Google Drive";
        url = "https://drive.google.com/";
      }
      {
        keyword = "gmail";
        name = "Gmail";
        url = "https://mail.google.com/mail/u/0/#all";
      }
      {
        name = "Chess";
        url = "https://www.chess.com/";
      }
      {
        name = "Lichess";
        url = "https://lichess.org/";
      }
      {
        name = "Fast";
        url = "https://fast.com/";
      }
      {
        name = "WhatsApp";
        url = "https://web.whatsapp.com/";
      }
      {
        name = "Keybr";
        url = "https://www.keybr.com/";
      }
      {
        name = "Monkeytype";
        url = "https://monkeytype.com/";
      }
      {
        name = "Duolingo";
        url = "https://www.duolingo.com/";
      }
      {
        name = "LinkedIn";
        url = "https://www.linkedin.com/";
      }
      {
        name = "LeetCode";
        url = "https://leetcode.com/";
      }
      {
        name = "Google Docs";
        url = "https://docs.google.com/";
      }
      {
        name = "Catppuccin";
        url = "https://catppuccin.com/";
      }
      {
        name = "Google Translate";
        url = "https://translate.google.com/";
      }
      {
        keyword = "books";
        name = "Google Play Books";
        url = "https://play.google.com/books";
      }
      {
        name = "GitHub";
        url = "https://github.com/";
      }
      {
        keyword = "notion";
        name = "Notion";
        url = "https://app.notion.com/";
      }
      {
        name = "YouTube";
        url = "https://www.youtube.com/";
      }
      {
        name = "Excalidraw";
        url = "https://excalidraw.com/";
      }
      {
        keyword = "seedr";
        name = "Seedr";
        url = "https://www.seedr.cc/files";
      }
      {
        keyword = "nix";
        name = "NixOS Search";
        url = "https://search.nixos.org/packages?channel=unstable";
      }
    ];
  };
}
