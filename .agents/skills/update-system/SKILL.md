---
name: update-system
description: Update this NixOS flake, identify compatibility warnings, and record the required compatibility settings for the tesseract system.
---

# Update the system

Use this skill when the user asks to update the NixOS flake inputs or refresh the system configuration.

1. Run `nix flake update` from the repository root.
2. Empty both compatibility modules while keeping their imports unchanged:
   - `modules/compatibility.nix`
   - `home/modules/compatibility.nix`

   Leave each file as a valid empty Nix module, such as `_: { };`.

3. Perform a fast dry-run build of the `tesseract` system to expose evaluation errors and warnings:

   ```sh
   nix build .#nixosConfigurations.tesseract.config.system.build.toplevel --dry-run --show-trace
   ```

   Do not run `nixos-rebuild`; applying the configuration is the user’s responsibility.

4. Read the build output. For each compatibility/deprecation warning that can be suppressed by configuration, add the corresponding setting to the appropriate compatibility module. Keep system settings in `modules/compatibility.nix` and Home Manager settings in `home/modules/compatibility.nix`.
5. Add back only the compatibility settings needed to suppress warnings from the first dry-run, in the appropriate compatibility module. Repeat the dry-run and resolve actual errors. Do not hide unrelated warnings without understanding them.
6. Format every modified Nix file with the repository-required on-demand formatter:

   ```sh
   nix run nixpkgs#nixfmt-rfc-style -- <modified-nix-file>...
   ```

Leave the repository with both compatibility imports present, only currently required compatibility settings recorded in the compatibility modules, and no temporary files or edits left behind.
