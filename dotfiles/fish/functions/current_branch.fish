# Return the current Git branch
function current_branch
    git rev-parse --abbrev-ref HEAD
end