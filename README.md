# Dotfiles

Modern terminal setup with Oh-My-Zsh, Powerlevel10k, and enhanced CLI tools.

## Quick Start

```bash
# 1. Install prerequisites (see below)
# 2. Clone this repo
git clone git@github.com:EyuelAbebe/dot-files.git ~/dotfiles
cd ~/dotfiles

# 3. Backup existing configs
cp ~/.zshrc ~/.zshrc.backup 2>/dev/null
cp ~/.gitconfig ~/.gitconfig.backup 2>/dev/null

# 4. Copy configs
cp .zshrc ~/
cp .p10k.zsh ~/
cp .gitconfig.delta ~/
cp .tmux.conf ~/
cp -r nvim/ ~/.config/

# 5. Include delta in gitconfig
echo -e '\n[include]\n    path = ~/.gitconfig.delta' >> ~/.gitconfig

# 6. Reload shell
exec zsh
```

## Configuration Files

<details>
<summary><b>.zshrc</b> - Main shell configuration</summary>

### Features
- Two-line prompt: full path → directory name + git status
- Modern CLI tools integration (eza, bat, fzf, fd, ripgrep, zoxide)
- Oh-My-Zsh plugins (git, docker, python, terraform, kubectl, etc.)
- Custom aliases and functions
- FZF fuzzy finding with previews
- Smart history and completion

### Key Aliases
**Navigation:** `..` `...` `docs` `projects` | **Files:** `ls` `ll` `lt` `cat` | **Git:** `gs` `glog` `fgb` | **Docker:** `dps` `dcu` `dcd`

### Functions
- `mkcd <dir>` - Create and enter directory
- `proj` - Fuzzy project switcher
- `killport <port>` - Kill process on port
- `weather [city]` - Get weather
- `help` - Show full terminal guide
</details>

<details>
<summary><b>.p10k.zsh</b> - Powerlevel10k theme</summary>

### Prompt Layout
```
~/Documents/projects/personal/projects/dot-files        ✓ 0.5s  12:45
dot-files  master ⇡1 ✗2 ➜
```

**Line 1:** Full directory path | Status | Execution time | Clock
**Line 2:** Directory name | Git branch | Changes | Prompt arrow

### Indicators
- `⇡1` / `⇣1` - Commits ahead/behind
- `✗2` - Untracked files
- `+3` - Staged files
- `!1` - Modified files
- Green arrow = success | Red arrow = error

### Customization
```bash
p10k configure  # Run interactive configurator
```
</details>

<details>
<summary><b>.gitconfig.delta</b> - Enhanced git diffs</summary>

### Features
- Syntax-highlighted diffs
- Side-by-side diff view
- Line numbers
- File hyperlinks
- Better merge conflict resolution

### Usage
Automatically used with `git diff`, `git log -p`, `git show`
</details>

<details>
<summary><b>.tmux.conf</b> - Tmux configuration</summary>

### Features
- Modern key bindings
- Mouse support
- Status bar customization
- Vi mode navigation
- Plugin manager integration
</details>

<details>
<summary><b>nvim/</b> - Neovim configuration</summary>

### Features
- LSP support
- Tree-sitter syntax
- File explorer
- Fuzzy finder
- Git integration
- Custom key mappings
</details>

## Prerequisites

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Modern CLI tools
brew install eza bat fzf fd ripgrep zoxide git-delta neovim tmux

# Nerd Font (for icons)
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
```

Set your terminal font to **MesloLGS NF**.

## FZF Keybindings

- `CTRL+T` - Fuzzy file search with preview
- `CTRL+R` - Fuzzy history search
- `ALT+C` - Fuzzy directory search
- `CTRL+/` - Toggle preview

## Troubleshooting

**Icons not showing?** Ensure your terminal uses "MesloLGS NF" font.

**Slow startup?** Debug with `zsh -xv`

**Plugin missing?** Check `ls ~/.oh-my-zsh/custom/plugins/`

## Updating

```bash
cd ~/dotfiles && git pull
cp .zshrc .p10k.zsh .gitconfig.delta .tmux.conf ~/
cp -r nvim/ ~/.config/
exec zsh
```
