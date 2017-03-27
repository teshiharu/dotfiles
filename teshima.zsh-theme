# this theme depends on git plugin.

function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_ADDED=$(str_with_color cyan '+')
ZSH_THEME_GIT_PROMPT_MODIFIED=$(str_with_color yellow '*')
ZSH_THEME_GIT_PROMPT_DELETED=$(str_with_color red 'x')
ZSH_THEME_GIT_PROMPT_RENAMED=$(str_with_color blue 'o')
ZSH_THEME_GIT_PROMPT_UNMERGED=$(str_with_color magenta '!')
ZSH_THEME_GIT_PROMPT_UNTRACKED=$(str_with_color grey '?')

function my_git_status() {
    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
}

#LOCATION=$(str_with_color red '[MAIN] ')
#DATE_TIME=$(str_with_color green '%D{%Y-%m-%d %K:%M}')
#DATE_TIME=$'%{\e[38;5;112m%}%D{%m/%d %K:%M}'
#PROMPT_PREFIX=$(str_with_color red '#')
#SEPARATOR1=$'%{\e[38;5;112m%}|'
USER_NAME=$'%{\e[38;5;253;48;5;239m%}%n@\e[m%}'
#SEPARATOR2=$(str_with_color black '@')
HOST_NAME=$(str_with_color white '%m')
SEPARATOR3=$(str_with_color white ':')
CURRENT_DIRECTORY=$(str_with_color white '%~')
PROMPT_CHAR=$(str_with_color white '$ ')
PROMPT='${USER_NAME}${HOST_NAME}${SEPARATOR3}${CURRENT_DIRECTORY}$(my_git_status)
$ '
TEST=$'%{\e[38;5;253;48;5;239m%}%D{%m/%d %K:%M}%{\e[m%}'
RPRONPT='${TEST}
 '
