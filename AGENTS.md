# AGENTS.md

This document provides instructions, context, and operational guidelines for AI coding agents operating on this NixOS configuration repository.

---

## 📌 Project Overview

This repository manages the system and user configurations for the host **`tesseract`** (owned by user `dhanush`) using **NixOS Flakes** and **Home Manager**.

- **Host Name**: `tesseract`
- **Primary User**: `dhanush`
- **Nix Flake Entry**: `nixosConfigurations.tesseract` ([flake.nix](flake.nix))
- **System State Version**: `26.05`
- **Desktop Environment / Window Manager**: Hyprland (Wayland), SDDM Display Manager
- **Design System / Theme**: Stylix

---

## 📂 Repository Architecture

```
.
├── flake.nix                  # Flake entry point, input channels, and nixosConfigurations
├── flake.lock                 # Locked versions of flake inputs
├── AGENTS.md                  # Agent instructions and guidelines
├── README.md                  # Repository documentation
├── assets/                    # System assets & media
│   └── wallpapers/            # Desktop wallpapers (gargantua.jpg, totem.jpg)
├── hosts/                     # Host-specific configurations
│   └── tesseract/             # Configurations specific to the host 'tesseract'
│       ├── default.nix        # Aggregate imports for the host config
│       ├── configuration.nix  # System-level configuration (imports system modules)
│       └── hardware-configuration.nix # Auto-generated hardware scan results
├── modules/                   # Modular system-level NixOS configurations
│   ├── kanata/                # Kanata daemon and key mapping configs (default.nix, kanata-config.kbd)
│   ├── themes/                # Theme and font configuration modules via Stylix
│   │   ├── default.nix
│   │   ├── cursor.nix
│   │   ├── fonts.nix
│   │   ├── icons.nix
│   │   └── kde-icons.nix
│   ├── bluetooth.nix          # Bluetooth system service enabling
│   ├── boot.nix               # System boot loader & kernel parameters
│   ├── compatibility.nix      # System compatibility configuration
│   ├── fuse.nix               # FUSE configuration
│   ├── hyprland.nix           # Hyprland system enabling config
│   ├── keyboard.nix           # Console keyboard configuration
│   ├── locale.nix             # System locale & timezone configuration
│   ├── networking.nix         # Networking, firewall, and host configurations
│   ├── nix.nix                # Nix garbage collection, channels, and optimization settings
│   ├── plymouth.nix           # Splash screen setup
│   ├── podman.nix             # Podman system service configuration
│   ├── sddm.nix               # SDDM display manager system service & theme
│   ├── security.nix           # Sudo, Polkit, and general security settings
│   └── users.nix              # Primary user account setup (dhanush)
└── home/                      # User-level Home Manager configurations
    ├── dhanush/
    │   ├── default.nix        # Primary user Home Manager entry point (imports modules)
    │   └── home.nix           # Core home manager settings (username, homeDirectory, stateVersion)
    └── modules/               # Modular user program, terminal, and shell configurations
        ├── cli/               # CLI utility configs (bat, eza, fd, fzf, gpg, jq, pass, ripgrep, zoxide)
        │   └── default.nix    # Imports CLI configs and defines general packages (duf, dust, fx, tldr, unzip)
        ├── compatibility.nix  # Compatibility layers for applications
        ├── development/       # Development setups, compilers, and IDEs
        │   ├── agents/        # AI developer agents (antigravity-cli, copilot, codex, opencode)
        │   ├── editors/       # Editor setups (nixvim, vscode, zed)
        │   ├── default.nix    # Imports dev tools and defines system programming language tools (ffmpeg, python)
        │   ├── go.nix         # Go compiler / toolchain setup
        │   └── uv.nix         # Python uv packager setup
        ├── hyprland/          # User Hyprland configuration, widgets, lock, and idle
        │   ├── hypr/          # Hyprland custom script configuration (hyprland.lua)
        │   ├── waybar/        # Waybar bar configurations, style.css, and rebuild-status.sh
        │   ├── wofi/          # Wofi search launcher css & config
        │   ├── hypridle.nix   # Idle management configuration
        │   ├── hyprlock.nix   # Lock screen setup
        │   └── mako.nix       # Notification daemon configuration
        ├── programs/          # Application configs (firefox, keepassxc, mpv, rclone, zen-browser)
        ├── shells/            # Shell configurations (bash, zsh with plugins/aliases, oh-my-posh prompt)
        ├── system/            # System tools (bluetooth helper, btop, clipboard, applets, podman, rebuild helper, yazi)
        │   └── rebuild/       # NixOS rebuild status script/helper (rebuild.sh)
        ├── terminal/          # Terminal emulators (kitty, tmux)
        └── vcs/               # Version control systems (git, jujutsu, jjui, lazygit, gh, delta)
```

---

## 🛠️ Essential Commands & Workflows

### Formatting Code

- Every changed file must be formatted using the appropriate formatter for its file type (not just Nix files).
- Formatter tools can be executed on-demand via `nix run` (e.g., `nix run nixpkgs#nixfmt-rfc-style -- <file>`, `nix run nixpkgs#stylua -- <file>`).

### Discovering Configuration Options & Reading Documentation

This workflow applies when discovering configuration options or reading documentation—**specifically for NixOS system options, Home Manager user options, and Nixvim plugin options, but is NOT limited to these** and applies universally to **every application, CLI utility, daemon, GUI tool, and service** across the entire system and user configurations:

1. **Always Clone First**: When looking for options or documentation for an application, framework, or module that hasn't been cloned yet (e.g. NixOS/nixpkgs, Home Manager, Nixvim, or any standalone application repo), always attempt to clone the upstream documentation or source repository first to a stable location (e.g. `~/.cache/docs/<repo-name>`) and search inside it locally using `rg` and `fd`.
2. **Web Search Fallback**: Only if documentation or options are not available as a cloneable repository should you fall back to web search.
3. **Never Run `nix eval`**: Never run local evaluation commands such as `nix eval` to figure out configuration options.
4. **Prioritize Speed without Guessing**: Prioritize speed, but never guess option names, types, syntax, or default values—always verify against documentation or source definitions.
5. **Track Cloned Repositories**: Every cloned repository must be recorded in [Cloned Documentation Repositories](#-cloned-documentation-repositories) below to prevent duplicate clones.

---

## 📚 Cloned Documentation Repositories

Repositories cloned for documentation and option discovery must be listed here to avoid duplicate clones across agent sessions:

| Repository | Stable Path | Purpose |
| ---------- | ----------- | ------- |
| `nix-community/home-manager` | `~/.cache/docs/home-manager` | Home Manager options and module definitions |

---

## 📐 Guidelines for AI Agents

1. **Modularity First**:
   - Do not bloat configuration or entrypoint files with inline configurations.
   - Store system-level services or environment settings in separate files/folders under [modules/](modules/) and import them in [hosts/tesseract/configuration.nix](hosts/tesseract/configuration.nix).
   - Store user-level program or service configurations in dedicated files/folders under [home/modules/](home/modules/) and import them in their respective category's `default.nix` (which is imported in [home/dhanush/default.nix](home/dhanush/default.nix)).

2. **System vs. User Scope**:
   - **System Scope ([hosts/tesseract/configuration.nix](hosts/tesseract/configuration.nix) / [modules/](modules/))**: System daemons, hardware, bootloader, kernel modules, display manager, user accounts, and system security rules.
   - **User Scope ([home/dhanush/](home/dhanush/) / [home/modules/](home/modules/))**: User environment, shell aliases, dotfiles, desktop tools, editors, and CLI utilities.

3. **Package Additions**:
   - Add general user CLI tools, browsers, dev tools, and editors to the appropriate category's `default.nix` file (e.g. general dev packages to [home/modules/development/default.nix](home/modules/development/default.nix), general CLI tools to [home/modules/cli/default.nix](home/modules/cli/default.nix)).
   - Use `inputs.<input_name>` syntax when referencing flake inputs (e.g., `inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default`).

4. **Preserve System Rules**:
   - Keep existing `stateVersion` settings (`26.05`) intact (both in [hosts/tesseract/configuration.nix](hosts/tesseract/configuration.nix) and [home/dhanush/home.nix](home/dhanush/home.nix)).
   - Maintain security/sudo rules in [hosts/tesseract/configuration.nix](hosts/tesseract/configuration.nix) or system security module [modules/security.nix](modules/security.nix).

5. **VCS / Git Operations**:
   - **Never use git**: Do not run any `git` command (including `git add`, `git commit`, `git status`, etc.) under any circumstances.
   - **Allowed `jj` commands**: You are allowed to use `jj diff`, `jj log`, `jj describe`, `jj status`, and `jj new` / `jj commit` for version control operations.

6. **Nixos Rebuild Operations**:
   - **Never use `nixos-rebuild`**: Do not run the `nixos-rebuild` command (including `nixos-rebuild switch` or `nixos-rebuild build`) under any circumstances. Testing, building, and applying the system configuration is the user's responsibility.

7. **Discovering Configuration Options & Reading Documentation**:
   - **Scope (NixOS, Home Manager, Nixvim & Beyond)**: Specifically applies when looking up configuration options for **NixOS**, **Home Manager**, and **Nixvim**, but is **not limited to these**—it governs every application, daemon, CLI utility, window manager component, editor plugin, or service configured across the repository.
   - **Always Clone First**: When looking for options or documentation for an uncloned component, agents must always attempt to clone the upstream documentation or source repository first to a stable location (e.g. `~/.cache/docs/<repo-name>`) and search inside it locally using `rg` and `fd`.
   - **Web Search Fallback**: If the docs are not available as a repository, use web search.
   - **Avoid Duplicate Clones**: Check existing entries first and document any newly cloned repository in [Cloned Documentation Repositories](#-cloned-documentation-repositories).
   - **Never Run `nix eval`**: Never run local commands like `nix eval` to discover options.
   - **Prioritize Speed without Guessing**: Move quickly, but never guess options or configuration syntax.

8. **Modern CLI Tool Usage (Prefer Installed Modern Replacements)**:
   - When executing commands, discovering files, analyzing content, or inspecting code, agents **must always prioritize modern CLI tools** installed in the environment over legacy GNU/Unix utilities.
   - Specifically, use the following installed tools:
     - **`ripgrep` (`rg`)** in place of `grep`, `egrep`, or `fgrep` (for fast recursive search and regex pattern matching).
     - **`fd`** in place of `find` (for fast file and directory discovery).
     - **`bat`** in place of `cat` or `less` (for syntax highlighting and file viewing).
     - **`eza`** in place of `ls` and `tree` (for directory listings and tree inspection, e.g. `eza -la`, `eza --tree`).
     - **`jq`** for parsing and manipulating JSON data in command pipelines.
     - **`delta`** in place of raw `diff` (for syntax-highlighted diff viewing).
     - **`tldr`** alongside `man` (for quick command syntax cheat sheets and practical examples).

9. **Nixvim Plugin Configuration**:
   - Nixvim configuration is modularized under [home/modules/development/editors/nixvim/](home/modules/development/editors/nixvim/).
   - Place individual plugin modules in dedicated files under [home/modules/development/editors/nixvim/plugins/<plugin-name>.nix](home/modules/development/editors/nixvim/plugins/) (or subdirectories like `languages/`, `lsp/`, `mini/`, `snacks/`, `treesitter/` when domain-specific).
   - Standard plugin format:
     ```nix
     _:

     {
       plugins.<plugin-name> = {
         enable = true;
         # settings = { ... };
       };

       # Optional keymaps
       # keymaps = [ ... ];
     }
     ```
   - Always import newly created plugin files in [home/modules/development/editors/nixvim/plugins/default.nix](home/modules/development/editors/nixvim/plugins/default.nix), maintaining alphabetical order.

---

## 🧪 Verification Protocol

Before declaring any change complete:

1. Format modified files using the appropriate formatter (e.g., via `nix run`).
