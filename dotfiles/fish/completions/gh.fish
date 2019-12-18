complete --command gh \
    --condition '__fish_is_token_n 2' \
    --arguments '(__gh_user_completion)' \
    --no-files

# Return a list of users from $CODE/github.com for `gh <user>`
function __gh_user_completion
    ls -L "$CODE/github.com"
end

complete --command gh \
    --condition '__fish_is_token_n 3' \
    --arguments '(__gh_repo_completion)' \
    --no-files

# Return a list of repositories for `gh user <repo>`
function __gh_repo_completion
    set user (commandline --tokenize)[2]
    ls -L "$CODE/github.com/$user"
end