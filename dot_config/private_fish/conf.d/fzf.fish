set -x FZF_DEFAULT_OPTS "--no-mouse --prompt=\"❯ \""
set -x FZF_CTRL_T_COMMAND "command fd --type file | sed 's@^\./@@'"
set -x FZF_ALT_C_COMMAND "command fd --type directory | sed 's@^\./@@'"

fish_add_path (brew --prefix)/opt/fzf/bin
source (brew --prefix)/opt/fzf/shell/key-bindings.fish
fzf_key_bindings
