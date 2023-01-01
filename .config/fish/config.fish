set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# python
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

# ruby
set -U fish_user_paths /opt/homebrew/bin/ $fish_user_paths
rbenv init - | source

# nodejs
set -Ux NODENV_ROOT $HOME/.nodenv
set -Ux fish_user_paths $NODENV_ROOT/bin $fish_user_paths
nodenv init - | source

# postgres
set -U fish_user_paths /Applications/Postgres.app/Contents/Versions/14/bin $fish_user_paths

# starship
starship init fish | source

set -Ux GOPATH /Volumes/code/go
set -Ux GOPRIVATE "github.com/dylanj/*"


