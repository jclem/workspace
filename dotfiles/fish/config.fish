set -x fish_greeting # Removes the "Welcome to fish" message
set -x CODE "$HOME/src"
set -x CONFIG "$HOME/.config"
set -x GOPATH "$CODE/go"
set -x MY_CODE "$CODE/github.com/jclem"

source $CONFIG/fish/abbreviations.fish

if test -f "$HOME/.asdf/asdf.fish"
    source "$HOME/.asdf/asdf.fish"
end

# Additions to the PATH
set -x PATH $PATH "$HOME/.bin" "$GOPATH/bin"

# Enable vi keybindings
# See: https://fishshell.com/docs/current/commands.html#fish_vi_mode
fish_vi_key_bindings

for local_config in $CONFIG/fish/config.local/*.fish
    source $local_config
end
