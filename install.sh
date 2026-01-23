#!/bin/zsh

set -euo pipefail

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly NC='\033[0m' # No Color

# Get the directory of this script
if [[ -n "${BASH_SOURCE[0]:-}" ]]; then
    readonly DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
    readonly DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
fi

# Functions for colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Enhanced backup function
backup_if_exists() {
    local file="$1"

    if [[ -f "$file" ]] || [[ -L "$file" ]] || [[ -d "$file" ]]; then
        local backup_file="${file}.backup"

        # Check if it's a broken symlink
        if [[ -L "$file" ]] && [[ ! -e "$file" ]]; then
            print_warning "Removing broken symlink: $file"
            rm "$file"
            return 0
        fi

        print_warning "Backing up existing $file to $backup_file"

        if cp -r "$file" "$backup_file"; then
            return 0
        else
            print_error "Failed to backup $file"
            exit 1
        fi
    fi

    return 0
}

# Enhanced symlink creation
create_symlink() {
    local source="$1"
    local target="$2"

    # Validate source exists
    if [[ ! -e "$source" ]]; then
        print_error "Source file does not exist: $source"
        exit 1
    fi

    # Create target directory if it doesn't exist
    local target_dir
    target_dir="$(dirname "$target")"
    if [[ ! -d "$target_dir" ]]; then
        if mkdir -p "$target_dir"; then
            print_info "Created directory: $target_dir"
        else
            print_error "Failed to create directory: $target_dir"
            exit 1
        fi
    fi

    # Backup existing file
    backup_if_exists "$target"

    # Create symlink
    if ln -sf "$source" "$target"; then
        print_success "Symlink created: $target -> $source"
        return 0
    else
        print_error "Failed to create symlink: $target -> $source"
        exit 1
    fi
}

# Install Claude configuration files
install_claude() {
    print_info "Installing Claude configuration"

    # Create ~/.claude directory if it doesn't exist
    if [[ ! -d "$HOME/.claude" ]]; then
        if mkdir -p "$HOME/.claude"; then
            print_info "Created directory: $HOME/.claude"
        else
            print_error "Failed to create directory: $HOME/.claude"
            exit 1
        fi
    fi

    # Claude configuration - symlink individual items inside ~/.claude
    local claude_src="$DOTFILES_DIR/claude"

    if [[ -d "$claude_src" ]]; then
        # Symlink CLAUDE.md (personal memory/instructions)
        if [[ -f "$claude_src/CLAUDE.md" ]]; then
            create_symlink "$claude_src/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
        fi

        # Symlink commands directory (slash commands)
        if [[ -d "$claude_src/commands" ]]; then
            create_symlink "$claude_src/commands" "$HOME/.claude/commands"
        fi

        # Symlink docs directory (reference documentation)
        if [[ -d "$claude_src/docs" ]]; then
            create_symlink "$claude_src/docs" "$HOME/.claude/docs"
        fi

        # Symlink skills directory (reusable skills with SKILL.md files)
        if [[ -d "$claude_src/skills" ]]; then
            create_symlink "$claude_src/skills" "$HOME/.claude/skills"
        fi

        # Symlink rules directory (modular topic-specific instructions)
        if [[ -d "$claude_src/rules" ]]; then
            create_symlink "$claude_src/rules" "$HOME/.claude/rules"
        fi

        # Symlink agents directory (custom subagents as Markdown files)
        if [[ -d "$claude_src/agents" ]]; then
            create_symlink "$claude_src/agents" "$HOME/.claude/agents"
        fi

        # Symlink hooks directory (custom hook scripts)
        if [[ -d "$claude_src/hooks" ]]; then
            create_symlink "$claude_src/hooks" "$HOME/.claude/hooks"
        fi

        # Symlink settings.local.json if it exists (personal settings overrides)
        if [[ -f "$claude_src/settings.local.json" ]]; then
            create_symlink "$claude_src/settings.local.json" "$HOME/.claude/settings.local.json"
        fi

        print_success "Claude configuration installed successfully"
    else
        print_warning "No Claude configuration found in dotfiles (expected: claude/)"
    fi
}

# Main installation function
main() {
    print_info "Starting dotfiles installation..."

    # Create necessary directories
    mkdir -p ~/.config ~/bin

    # Legacy symlinks (keep existing functionality)
    print_info "Creating legacy configuration symlinks..."
    
    # Neovim config
    if [[ -d "$DOTFILES_DIR/nvim" ]]; then
        create_symlink "$(realpath "$DOTFILES_DIR/nvim")" "$HOME/.config/nvim"
    fi
    
    # Various config files
    local -A legacy_symlinks=(
        ["$DOTFILES_DIR/tmux/.tmux.conf"]="$HOME/.tmux.conf"
        ["$DOTFILES_DIR/zsh/.zshrc"]="$HOME/.zshrc"
        ["$DOTFILES_DIR/git/.gitconfig"]="$HOME/.gitconfig"
        ["$DOTFILES_DIR/git/git_diff_wrapper"]="$HOME/bin/git_diff_wrapper"
        ["$DOTFILES_DIR/ideavim/.ideavimrc"]="$HOME/.ideavimrc"
    )

    for source in "${!legacy_symlinks[@]}"; do
        if [[ -e "$source" ]]; then
            create_symlink "$source" "${legacy_symlinks[$source]}"
        else
            print_warning "Source file not found, skipping: $source"
        fi
    done

    # Install Claude configuration
    install_claude

    # Set up .z.sh
    print_info "Setting up z.sh..."
    if [[ ! -f "$HOME/.z.sh" ]]; then
        curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.z.sh
        print_success "z.sh installed"
    else
        print_info "z.sh already exists, skipping"
    fi

    # Set up oh my zsh
    print_info "Checking oh-my-zsh installation..."
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        print_info "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        print_success "oh-my-zsh installed"
    else
        print_info "oh-my-zsh already installed, skipping"
    fi

    print_success "Dotfiles installation completed successfully!"
    print_info "Please restart your terminal or run 'source ~/.zshrc' to apply changes"
}

# Parse command line arguments
if [[ "$#" -gt 0 ]]; then
    case "$1" in
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --claude    Install Claude configuration files only"
            echo "  --help,-h   Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0          # Run full installation"
            echo "  $0 --claude # Install Claude configuration only"
            exit 0
            ;;
        --claude)
            echo "Installing Claude configuration files..."
            install_claude
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
else
    echo "This will install dotfiles and modify your system configuration."
    echo "Existing files will be backed up with .backup extension."
    echo ""
    read -p "Are you sure you want to continue? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        main
    else
        print_info "Installation cancelled"
    fi
fi
