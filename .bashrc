alias df="dysk"
alias ls='eza --icons always'
alias ll='eza -la --icons always'
alias tree='eza --tree --icons'
alias nv='nvim'

# Black OLED (монохром): только #000/#fff + bold/dim
RESET='\[\e[0m\]'
BOLD='\[\e[1m\]'
DIM='\[\e[2m\]'
W='\[\e[38;2;255;255;255m\]'

parse_git() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch
    branch=$(git branch --show-current)

    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        printf " \001\e[1;38;2;255;255;255m\002*\001\e[0m\002 \001\e[38;2;255;255;255m\002%s\001\e[0m\002" "$branch"
    else
        printf " \001\e[38;2;255;255;255m\002✓\001\e[0m\002 \001\e[38;2;255;255;255m\002%s\001\e[0m\002" "$branch"
    fi
}

PS1="${W}${BOLD}\u${RESET}${W}@${W}\h${RESET}:${W}${BOLD}\w${RESET}\$(parse_git) ${W}${DIM}\A${RESET} \$ "
PROMPT_COMMAND='printf "\n"'

# fzf — монохром (выделение — инверсией)
export FZF_DEFAULT_OPTS='--color=bg:#000000,fg:#ffffff,hl:#ffffff,hl+:#000000,bg+:#ffffff,fg+:#000000,gutter:#000000,pointer:#ffffff,marker:#ffffff,prompt:#ffffff,spinner:#ffffff,info:#ffffff,border:#ffffff,header:#ffffff'

# eza — только белый: dir=bold, exec=underline, symlink=italic, root=reverse
export EZA_COLORS='fi=38;2;255;255;255:di=1;38;2;255;255;255:ex=4;38;2;255;255;255:ln=3;38;2;255;255;255:or=7:pi=7:so=7:bd=7:cd=7:xx=38;2;255;255;255:da=38;2;255;255;255:in=38;2;255;255;255:bl=38;2;255;255;255:hd=1;38;2;255;255;255:lc=38;2;255;255;255:lm=38;2;255;255;255:df=38;2;255;255;255:ds=38;2;255;255;255:lp=38;2;255;255;255:oc=38;2;255;255;255:uu=1;38;2;255;255;255:uR=7:un=38;2;255;255;255:gu=1;38;2;255;255;255:gR=7:gn=38;2;255;255;255:sn=38;2;255;255;255:sb=38;2;255;255;255:ga=38;2;255;255;255:gm=1;38;2;255;255;255:gd=38;2;255;255;255:gv=38;2;255;255;255:gt=38;2;255;255;255:gi=38;2;255;255;255:gc=7:Gm=1;38;2;255;255;255:Go=38;2;255;255;255:Gc=38;2;255;255;255:Gd=1;38;2;255;255;255:ur=38;2;255;255;255:uw=38;2;255;255;255:ux=4;38;2;255;255;255:ue=4;38;2;255;255;255:gr=38;2;255;255;255:gw=38;2;255;255;255:gx=4;38;2;255;255;255:tr=38;2;255;255;255:tw=38;2;255;255;255:tx=4;38;2;255;255;255:su=1;38;2;255;255;255:sf=1;38;2;255;255;255:xa=38;2;255;255;255'

export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
