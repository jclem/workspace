# Send a repository dispatch event to the current repository
function repo_dispatch
    argparse --name=repo_dispatch --max-args=1 'h/help' 'r/repo=' -- $argv

    if set -q _flag_h
        echo "\
Usage: repo_dispatch [<options>] <event_type>

Send a repository dispatch event to the repository for the current working directory.
https://developer.github.com/actions/managing-workflows/triggering-a-repositorydispatch-webhook/

Options:

    -r/--repo   The repository to dispatch to (defaults to the current directory repository)"

        return 0
    end

    if set -q _flag_r
        set repo $_flag_r
    else
        set repo (repo)
    end

    if set -q argv[1]
        set event_type $argv[1]
    else
        set event_type "test"
    end

    curl -f -X POST "https://api.github.com/repos/$repo/dispatches" \
        -H "Accept: application/vnd.github.everest-preview+json" \
        -H "Authorization: token "(github_token) \
        -H "Content-type: application/json" \
        -d "{\"event_type\": \"$event_type\"}"
end