# AGENTS.md

This document provides instructions, context, and operational guidelines for AI coding agents operating on this NixOS configuration repository.

---

## 📌 Project Overview

This repository manages the system and user configurations for the host **`tesseract`** (owned by user `dhanush`) using **NixOS Flakes** and **Home Manager**.

- **Host Name**: `tesseract`
- **Primary User**: `dhanush`
- **Nix Flake Entry**: `nixosConfigurations.tesseract` ([flake.nix](file:///home/dhanush/nixos-config/flake.nix))
- **System State Version**: `26.05`
- **Desktop Environment / Window Manager**: Hyprland (Wayland), SDDM Display Manager
- **Design System / Theme**: Stylix

---

## 📂 Repository Architecture

```
.
├── flake.nix                  # Flake entry point, input channels, and nixosConfigurations
├── flake.lock                 # Locked versions of flake inputs
├── configuration.nix          # System-level NixOS configuration (boot, kernel, user, sudo)
├── hardware-configuration.nix # Auto-generated hardware scan results
├── home.nix                   # User-level Home Manager entry point
└── programs/                  # Modular program & service configurations
    ├── packages.nix           # General user package declarations (CLI, Browsers, DevTools)
    ├── bat/                   # Bat syntax highlighter config
    ├── eza/                   # Eza ls replacement config
    ├── fzf/                   # Fzf fuzzy finder config
    ├── git/                   # Git VCS configuration
    ├── kanata/                # Kanata key remapping daemon
    ├── kitty/                 # Kitty terminal emulator config
    ├── neovim/                # Neovim editor configuration
    ├── stylix/                # System theme & styling rules
    ├── tmux/                  # Tmux terminal multiplexer config
    ├── waybar/                # Waybar status bar config
    ├── wofi/                  # Wofi application launcher config
    ├── yazi/                  # Yazi terminal file manager config
    ├── zoxide/                # Zoxide directory jumper config
    └── zsh/                   # Zsh shell configuration
```

---

## 🛠️ Essential Commands & Workflows

### 1. Formatting Code
- Formatting tool: `nixfmt` (installed in profile via [packages.nix](file:///home/dhanush/nixos-config/programs/packages.nix)).
- Format Nix code:
  ```bash
  nixfmt *.nix programs/**/*.nix
  ```

---

## 📐 Guidelines for AI Agents

1. **Modularity First**:
   - Do not bloat [configuration.nix](file:///home/dhanush/nixos-config/configuration.nix) or [home.nix](file:///home/dhanush/nixos-config/home.nix) with inline tool configurations.
   - Store application-specific configurations in dedicated subdirectories under `programs/<app>/` and import them in `home.nix` or `configuration.nix`.

2. **System vs. User Scope**:
   - **`configuration.nix`**: System daemons, hardware, bootloader, kernel modules, display manager, user accounts, and system security rules.
   - **`home.nix` / `programs/`**: User environment, shell aliases, dotfiles, desktop tools, editors, and CLI utilities.

3. **Package Additions**:
   - Add general user CLI tools, browsers, dev tools, and editors to [programs/packages.nix](file:///home/dhanush/nixos-config/programs/packages.nix).
   - Use `inputs.<input_name>` syntax when referencing flake inputs (e.g., `inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default`).

4. **Preserve System Rules**:
   - Keep existing `stateVersion` settings (`26.05`) intact.
   - Maintain security sudo rules in `configuration.nix`.

5. **Git Operations**:
   - **Never use git**: Do not run any `git` command (including `git add`, `git commit`, `git status`, etc.) under any circumstances. Staging, committing, and managing repository state is the sole responsibility of the user.

6. **Nixos Rebuild Operations**:
   - **Never use `nixos-rebuild`**: Do not run the `nixos-rebuild` command (including `nixos-rebuild switch` or `nixos-rebuild build`) under any circumstances. Testing, building, and applying the system configuration is the user's responsibility.

---

## 🧪 Verification Protocol

Before declaring any change complete:
1. Format modified files using `nixfmt`.
