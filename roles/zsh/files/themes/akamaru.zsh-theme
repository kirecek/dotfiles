local awesome_circle=" "
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

RPS1="${return_code}"

PROMPT='$(git_prompt_info)%{${fg_bold[red]}%}${awesome_circle}  %{${reset_color}%}'
