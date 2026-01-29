# git-worktree-smart-checkout

An oh-my-zsh plugin that provides smart `git checkout` with automatic worktree redirect.

## What it does

When you try to checkout a branch that's already checked out in a worktree, instead of just showing an error, this plugin asks if you want to navigate to that worktree.

**Before:**
```bash
$ git checkout feat/my-feature
fatal: 'feat/my-feature' is already used by worktree at '/path/to/worktree'
```

**After:**
```bash
$ gco feat/my-feature
fatal: 'feat/my-feature' is already used by worktree at '/path/to/worktree'

Go to worktree at /path/to/worktree? (y/n) y
# Now you're in the worktree directory!
```

## Installation

### Using oh-my-zsh

1. Clone this repository into oh-my-zsh's plugins directory:
   ```bash
   git clone https://github.com/AdelinBaworktree/git-worktree-smart-checkout ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-worktree-smart-checkout
   ```

2. Add the plugin to your `.zshrc`:
   ```bash
   plugins=(... git-worktree-smart-checkout)
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```

### Manual Installation

Source the plugin file in your `.zshrc`:
```bash
source /path/to/git-worktree-smart-checkout.plugin.zsh
```

## Usage

Use `gco` instead of `git checkout`:

```bash
# Normal checkout (works exactly like git checkout)
gco main
gco -b new-feature

# When a worktree exists for the branch
gco feat/my-feature
# Shows error + prompts: "Go to worktree at /path? (y/n)"
# Press 'y' to cd there, 'n' to stay
```

## Features

- Full `git checkout` compatibility (all flags work)
- Tab completion (same as `git checkout`)
- Automatic worktree detection
- Simple y/n prompt to navigate
- Works on macOS and Linux

## Why?

If you use git worktrees for parallel development, you've probably seen this error hundreds of times:

```
fatal: 'branch' is already used by worktree at '/some/path'
```

This plugin turns that frustrating error into a helpful prompt, saving you from manually copying the path and running `cd`.

## License

MIT
