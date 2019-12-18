# Clone a repository, if necessary, and CD into it
function gh
    argparse --name=gh 'h/help' -- $argv

    if set -q _flag_h
        or test (count $argv) -lt 2
        echo "\
Usage: gh <owner> <repo> [<option>] 
Clone a GitHub repository, if necessary, and CD into its directory.
Flags can be passed to `git clone` by separating flags with `--`, for example:
    gh jclem workspace -- --depth=1
Options
    -h/--help    Print this help message"

        return 0
    end

    set -l repo "$argv[1]/$argv[2]"
    set -l repo_path "$CODE/github.com/$repo"
    set -l session_name (echo $repo | sed -E 's/[^a-zA-Z0-9\/_-]/-/g') # -E is BSD, use -r on Linux

    # Clone the repository if it does not exist
    if not test -d $repo_path
        git clone "https://github.com/$repo.git" "$repo_path" $argv[3..-1]
        or return $status
    end

    # Create a tmux session if it does not exist
    if not tmux has-session -t=$session_name 2>/dev/null
        tmux new -c $repo_path -Ad -s $session_name
        or return $status
    end

    # Switch or attach to the tmux session
    if set -q TMUX
        tmux switch -t $session_name
    else
        tmux attach -t $session_name
    end
end