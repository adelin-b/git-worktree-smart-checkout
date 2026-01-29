# git-worktree-smart-checkout - Smart git checkout with worktree redirect
#
# When `git checkout <branch>` fails because a worktree already exists,
# this plugin prompts you to navigate to that worktree instead.

# Unalias gco if it exists (from oh-my-zsh git plugin)
unalias gco 2>/dev/null

# Smart git checkout with worktree redirect
gco() {
    local output
    output=$(git checkout "$@" 2>&1)
    local exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
        echo "$output"
        return 0
    fi

    # Check if error is about worktree (macOS and Linux compatible)
    local wt_path
    wt_path=$(echo "$output" | sed -n "s/.*already used by worktree at '\([^']*\)'.*/\1/p")

    if [[ -n "$wt_path" ]]; then
        echo "$output"
        echo ""
        read -q "REPLY?Go to worktree at $wt_path? (y/n) "
        echo ""
        if [[ $REPLY == "y" ]]; then
            cd "$wt_path"
        fi
    else
        echo "$output"
        return $exit_code
    fi
}

# Use git-checkout completion for gco
compdef _git gco=git-checkout
