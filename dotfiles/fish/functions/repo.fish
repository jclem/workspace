# Print the current GitHub repository, if we're in one
function repo
    ruby -e "\
        match = /\/github\.com\/([^\/]+\/[^\/]+)/.match(Dir.pwd)
        puts match[1] if match
    "
end