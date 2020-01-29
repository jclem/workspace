# Fish abbreviations
# See: https://fishshell.com/docs/current/commands.html#abbr

if status --is-interactive
    abbr --add --global bc brew cask
    abbr --add --global bs brew services
    abbr --add --global dk docker
    abbr --add --global g git
    abbr --add --global hk heroku
    abbr --add --global n npm
    abbr --add --global tf terraform
    abbr --add --global y yarn
end
