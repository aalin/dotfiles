# vim: filetype=zsh ts=4 noexpandtab

function git_get_pair() {
	local pair
	pair=$(__git_prompt_git config --get user.pair 2> /dev/null)
	[[ ! -z "$pair" ]] && echo "$pair "
}

function git_prompt_info_with_pair() {
	local ref

	if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
		ref=$(__git_prompt_git symbolic-ref HEAD 2> /dev/null) || \
		ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return 0
		echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_get_pair)${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	fi
}

if [[ $(hostname) == "devbox" ]]; then
	ZSH_THEME_GIT_PROMPT_PREFIX=" %F{45}❨%F{87}"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%F{45}❩%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%F{33}✻%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_CLEAN=""

	PROMPT=$'%F{33}%M %F{39}%~%{$reset_color%}$(git_prompt_info_with_pair)%{\e[%(?.32.31);1m%} ➔%{$reset_color%} '
else
	ZSH_THEME_GIT_PROMPT_PREFIX=" %F{208}❨%F{220}"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%F{208}❩%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%F{196}✻%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_CLEAN=""

	PROMPT=$'%F{196}%M %F{202}%~%{$reset_color%}$(git_prompt_info_with_pair)%{\e[%(?.32.31);1m%} ➔%{$reset_color%} '
fi
