# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a macOS dotfiles repository that manages development environment configuration using Homebrew, Fish shell, and GNU Stow for symlink management. The repository follows a modular structure with separate directories for different types of configurations.

## Key Commands

### Setup and Installation

```bash
# Complete dotfiles installation (run from repository root)
make

# Individual components
make macos          # Install packages and link configs
make core-macos     # Install core tools (brew, fish, git, npm)
make packages       # Install all brew packages and casks
make link           # Create symlinks using stow
make unlink         # Remove symlinks
```

### Daily Management

```bash
# Use the dotfiles command for common tasks
dotfiles help       # Show available commands
dotfiles update     # Update all package managers and packages
dotfiles clean      # Clean up caches (brew, gem, pip)
dotfiles edit       # Open dotfiles in $VISUAL editor
dotfiles macos      # Apply macOS system defaults
```

### Package Management

```bash
# Homebrew packages
brew bundle --file=install/Brewfile

# Homebrew casks (GUI applications)
brew bundle --file=install/Caskfile

# Node.js packages (global)
fnm install --lts
npm install -g $(grep -v '^#' install/npmfile | awk '{print $1}' | tr '\n' ' ')
```

### Testing

```bash
# Run tests (requires bats)
make test
```

## Architecture

### Directory Structure

- `bin/` - Custom utility scripts (is-executable, is-arm64, is-supported, append)
- `config/` - Application configurations (stowed to ~/.config/)
  - `fish/` - Fish shell configuration and custom functions
  - `nvim/` - Neovim configuration (Lua-based)
  - `git/` - Git configuration
  - `kitty/`, `zellij/` - Terminal and multiplexer configs
- `install/` - Package definitions
  - `Brewfile` - Homebrew packages
  - `Caskfile` - Homebrew casks
  - `npmfile` - Node.js global packages
- `macos/` - macOS system defaults
- `runcom/` - Shell startup files (stowed to ~/)

### Stow Integration

The repository uses GNU Stow for managing symlinks:

- `config/` directory contents are linked to `~/.config/`
- `runcom/` directory contents are linked to `~/`
- Use `--no-folding` to prevent directory merging
- `--restow` ensures clean re-linking

### Shell Environment

- Primary shell: Fish (with vi key bindings)
- Prompt: Starship
- Package managers: fnm (Node.js), pyenv (Python), rbenv (Ruby)
- Terminal: Kitty with Zellij multiplexer support

### Key Tools and Dependencies

- **Homebrew**: Package manager for macOS
- **Fish Shell**: Modern shell with good defaults
- **GNU Stow**: Symlink farm manager
- **fnm**: Fast Node.js version manager
- **Neovim**: Primary editor (LazyVim-based configuration)
- **Starship**: Cross-shell prompt
- **Zoxide**: Smart cd replacement

## Development Workflow

### Making Changes

1. Edit configuration files in appropriate directories
2. Test changes in a new shell session
3. Use `dotfiles edit` to open the repository in your editor
4. Use `make link` to apply symlink changes

### Adding New Packages

- Homebrew packages: Add to `install/Brewfile`
- GUI applications: Add to `install/Caskfile`
- Node.js packages: Add to `install/npmfile`
- Run `make packages` to install new additions

### Architecture Considerations

- Support for both Apple Silicon and Intel Macs via `bin/is-arm64`
- Conditional installation paths based on architecture
- Environment isolation using XDG Base Directory specification
- Modular Fish shell configuration for easy customization
