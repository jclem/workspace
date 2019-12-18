# Alias `git` to `hub`, if `hub` exists
if type -q hub
    function git
        hub $argv
    end
end