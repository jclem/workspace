# See: https://fishshell.com/docs/current/commands.html#fish_prompt
function fish_prompt
    # Get the status of the most recently executed command
    set -l exit_code $status

    set_color blue
    printf (prompt_pwd)

    # Print the Git branch
    if test -d .git
        set_color purple
        printf ' (%s)' (current_branch ^/dev/null)
    end

    # Print a non-zero exit code
    if test $exit_code -ne 0
        set_color red
        printf ' ✗ %s' (echo $exit_code)
    end

    set_color green
    printf ' → '
    set_color normal
end