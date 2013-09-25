#Siddhu's bash_profile. Thanks to Troy Astle (http://github.com/trastle) for some of the cool functions here.

function improve_history
{
    # improve bash history
    shopt -s histappend
    # Store 10000 commands in bash history
    export HISTFILESIZE=10000
    export HISTSIZE=10000
    # Don't put duplicate lines in the history
    export HISTCONTROL=ignoredups
}

function zipdir
{
     if [ -z "$1"  ] || [ -z "$2" ] || [ -n "$3" ];
     then
        echo " "
        echo "INCORRECT USAGE:"
        echo "Expected: zipdir source destination"
        echo "Example:  zipdir  ./example ./example.zip"
        echo " "
     else
        zip -r "$2" "$1"
     fi
}

function searchdir
{
     find . -exec grep -H "$1" {} \;
}

function set_aliases
{
    alias ll="ls -l"
    alias la="ls -a"
    alias l=ls
    alias lla="ls -la"
    alias llh="ls -lh"
}

function setup_git
{
    # Git tab completion
    if [ ! -f ~/.git-completion.bash ]; then
         curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    fi
    source ~/.git-completion.bash
    # Git prompt
    if [ ! -f ~/.git-prompt.sh ]; then
         curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh 
    fi
    GIT_PS1_SHOWUPSTREAM="verbose"
    GIT_PS1_SHOWCOLORHINTS="yes"
    GIT_PS1_SHOWDIRTYSTATE="true"
    source ~/.git-prompt.sh
}

function setup_gitconfig
{
    git config --global user.name "Siddhu Warrier"
    git config --global user.email "siwarrie@cisco.com"
    git config --global core.editor /usr/bin/vim
}

function setup_git_prompt
{
    export PROMPT_COMMAND='__git_ps1 "\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h: \w\[$(tput sgr0)\]" "\\\$ ";'
}

set_aliases
improve_history
setup_git
setup_gitconfig
setup_git_prompt

export PATH=/Applications/Postgres.app/Contents/MacOS/bin/:/usr/local/heroku/bin:/usr/local/bin/:/usr/local/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin




