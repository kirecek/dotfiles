local colored_symbol="%{${fg_bold[black]}%}○%{${reset_color}%}"

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

RPS1="${return_code}"

PROMPT='%{${fg[black]}%}%2~%{${reset_color}%} $(git_prompt_info)${colored_symbol} %{${reset_color}%}'
