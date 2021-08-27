# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "~/.fzf/shell/key-bindings.bash"
