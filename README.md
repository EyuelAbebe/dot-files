# My Dotfiles

Clean, modern terminal configuration with Oh-My-Zsh and Powerlevel10k.

## What's Included

- **`.zshrc`** - Zsh configuration with modern CLI tools and aliases
- **`.p10k.zsh`** - Powerlevel10k theme configuration (Lean style)
- **`.gitconfig.delta`** - Git delta configuration for beautiful diffs
- **`.tmux.conf`** - Tmux configuration
- **`nvim/`** - Neovim configuration

## Features

### Modern CLI Tools
- **eza** - Better `ls` with icons and git integration
- **bat** - Better `cat` with syntax highlighting
- **fzf** - Fuzzy finder with file/history search
- **fd** - Better `find`
- **ripgrep** - Better `grep`
- **zoxide** - Smart directory jumper
- **git-delta** - Beautiful git diffs

### Oh-My-Zsh Plugins
- git
- docker & docker-compose
- npm, node, python, terraform, kubectl
- zsh-syntax-highlighting
- zsh-autosuggestions
- sudo, copyfile, copypath, extract, z

### Prompt Features
- Two-line prompt layout
- Full directory path on line 1
- Current directory + git info on line 2
- Git branch with status indicators
- Ahead/behind tracking
- Modified/staged/untracked file counts
- Execution time and status on right

## Prerequisites

Install these tools first:

```bash
# Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Modern CLI tools
brew install eza bat fzf fd ripgrep zoxide git-delta
```

## Installation

1. **Backup your existing configs:**
```bash
cp ~/.zshrc ~/.zshrc.backup
cp ~/.gitconfig ~/.gitconfig.backup
```

2. **Clone this repo:**
```bash
git clone git@github.com:EyuelAbebe/dot-files.git ~/dotfiles
cd ~/dotfiles
```

3. **Copy configs to home directory:**
```bash
cp .zshrc ~/
cp .p10k.zsh ~/
cp .gitconfig.delta ~/
```

4. **Add delta to your gitconfig:**
```bash
echo '[include]' >> ~/.gitconfig
echo '    path = ~/.gitconfig.delta' >> ~/.gitconfig
```

5. **Reload your shell:**
```bash
exec zsh
```

## Key Aliases

### Navigation
- `..` `...` `....` - Quick parent directory navigation
- `docs` `downloads` `desktop` `projects` - Quick navigation shortcuts
- `z <keyword>` - Jump to frequent directories

### File Operations
- `ls` `ll` `la` - Beautiful file listings with icons
- `lt` - Tree view
- `lsg` - File listing with git status
- `cat` - Syntax highlighted file viewing
- `tree [depth]` - Directory tree view

### Git
- `gs` - Git status (compact)
- `glog` - Beautiful git log graph
- `glg` - Detailed git log with author
- `gtree` - Quick git tree view
- `gbr` - Show branches with tracking
- `fgb` - Fuzzy git branch checkout

### Docker
- `dps` - Formatted docker ps
- `dimg` - Formatted docker images
- `dcu` `dcd` - docker-compose up/down
- `dcl` - Follow docker-compose logs

### Productivity
- `killport <port>` - Kill process on port
- `weather [city]` - Get weather
- `myip` - Show public IP
- `help` - Show terminal guide

### Functions
- `mkcd <dir>` - Create directory and cd into it
- `backup <file>` - Create .bak copy
- `gitclone <url>` - Clone and cd into repo
- `proj` - Interactive project switcher

## FZF Keybindings

- `CTRL+T` - Fuzzy file search with preview
- `CTRL+R` - Fuzzy history search
- `ALT+C` - Fuzzy directory search with tree preview
- `CTRL+/` - Toggle preview window

## Customization

### Change Prompt Style

Run the configurator to customize your prompt:
```bash
p10k configure
```

### Modify Aliases

Edit `~/.zshrc` and add your custom aliases at the bottom:
```bash
alias myalias='command'
```

Then reload:
```bash
source ~/.zshrc
```

## Theme Preview

Your prompt will look like:
```
~/Documents/projects/personal/projects/OneSend        ✓ 0.5s  12:45
OneSend  main ⇡1 ✗2 ➜
```

- Line 1: Full path + status + time
- Line 2: Directory name + git branch + changes + arrow
- Green arrow = success, Red arrow = error
- `⇡1` = 1 commit ahead
- `✗2` = 2 untracked files

## Updating

Pull latest changes:
```bash
cd ~/dotfiles
git pull
cp .zshrc ~/
cp .p10k.zsh ~/
source ~/.zshrc
```

## Troubleshooting

### Icons not showing?
Install a Nerd Font:
```bash
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
```
Then set your terminal to use "MesloLGS NF" font.

### Slow startup?
The instant prompt should make it fast. If still slow, check:
```bash
zsh -xv  # Debug startup
```

### Plugin not working?
Verify plugin is installed:
```bash
ls ~/.oh-my-zsh/custom/plugins/
```

## License

MIT - Feel free to use and modify!
