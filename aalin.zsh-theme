ZSH_THEME_GIT_PROMPT_PREFIX=" %F{208}❨%F{220}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{208}❩%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{196}✻%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT=$'%F{196}%M %F{202}%~%{$reset_color%}$(git_prompt_info)%{\e[%(?.32.31);1m%} ➔%{$reset_color%} '
