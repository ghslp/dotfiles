# dotfiles

My dotfiles

## Setup

Note:

* Source paths will need to be adjusted to account for user account name and code directory
* Destination paths will need to be adjusted to account for user account name

### Visual Studio Code

* Symlink keybindings and settings:

    ```bash
    ln -s "/Users/ghslp/code/dotfiles/vscode/keybindings.json" "/Users/ghslp/Library/Application Support/Code/User/keybindings.json"
    ln -s "/Users/ghslp/code/dotfiles/vscode/settings.json" "/Users/ghslp/Library/Application Support/Code/User/settings.json"
    ```
* Install extensions (will depend on project — start with unrecognized settings in settings.json)

### Fish shell

* Install [Fish](https://fishshell.com)

    ```bash
    brew install fish
    sudo nano /etc/shells
    # Add /usr/local/bin/fish to end of /etc/shells
    chsh -s /usr/local/bin/fish
    ```
    * Restart shell and ensure you’re using Fish (you may need to change Terminal or iTerm config)

* Install [Fisher](https://github.com/jorgebucaran/fisher)

* Install [Bass](https://github.com/edc/bass)

    ```sh
    fisher install edc/bass
    ```

* Install [nvm.fish](https://github.com/jorgebucaran/nvm.fish)

    ```sh
    fisher install jorgebucaran/nvm.fish
    ```

* Symlink config and prompt function:

    ```bash
    ln -s "/Users/ghslp/code/dotfiles/fish/config.fish" "/Users/ghslp/.config/fish/config.fish"
    ln -s "/Users/ghslp/code/dotfiles/fish/functions/fish_prompt.fish" "/Users/ghslp/.config/fish/functions/fish_prompt.fish"
    ```
