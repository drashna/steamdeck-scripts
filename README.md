# Steamdeck Script Commands

- `1_mkwritable.sh`: This script makes the Steamdeck system partition writable and updates the pacman keychain for first use. This is basically the same as step 2 in the install directions.
- `2_install-dev-tools.sh`: This will install most tools that are required to build packages from source; glibc, libdrm, ect. It will also reinstall any package files that were stripped by Valve to save space, that would otherwise be useful for development.
- `3_sshd.sh`: Sets up SSHd for use.
- `3_dedupe.sh`: For use with: https://gitlab.com/popsulfr/steamos-btrfs/. Uses Deduplication capabilities to save space.
- `3_joycons.sh`: This setups the required drivers to make Nintendo Switch Joycon controllers work with Steamdeck.

# Install

1. Open Desktop mode, Open up Konsole and set a password for the deck user: `passwd`

2. `sudo steamos-readonly disable;sudo pacman-key --init;sudo pacman-key --populate archlinux`

3. `mkdir -p ~/.local`

4. `git clone git@github.com:TheRealAlexV/steamdeck-scripts.git ~/.local/steamdeck-scripts`

5. Put the following in your `~/.bash_profile`:
```
export PATH="$PATH:$HOME/.local/steamdeck-scripts"
```

6. You may now use any of the Steamdeck script commands from the `Steamdeck Script Commands` section above.
