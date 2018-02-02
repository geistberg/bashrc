
NORMAL=$(tput sgr0);
BOLD=$(tput bold);
RED=$(tput setaf 1);
GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
BLUE=$(tput setaf 4);
MAGENTA=$(tput setaf 5);
CYAN=$(tput setaf 6);

branch_color () {
    if git rev-parse --git-dir >/dev/null 2>&1; then
        color=""
        if [ -z "$(git status -s)" ]; then
            color=${GREEN}
        else
            color="$BOLD$RED"
        fi
    fi
    echo -ne $color
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

PS1="\[\$YELLOW\]\h \[\$GREEN\] \W \[\$(branch_color)\]\$(parse_git_branch) \[\$MAGENTA\] <@}}))><( \[\$NORMAL\]"

