# Return the current GitHub token, using 1Password
function github_token
    # Sign in to 1Password if we aren't already
    op_signin

    if set -q GITHUB_TOKEN
        echo -n $GITHUB_TOKEN
        return 0
    end

    set -l op_token_uuid n57ndbviarfdrihnopimhjkuvq
    set -gx GITHUB_TOKEN (op get item $op_token_uuid | jq -r '.details.password')
    echo -n $GITHUB_TOKEN
end