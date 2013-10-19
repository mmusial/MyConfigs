function parse_git_branch {

        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'

}


function git_status {
	local BRANCH=
	local _M=0
	local _D=0
	local UNTRACKED=0
	local M_=0
	local D_=0
	local A_=0

	while IFS= read -r line
	do
		local XY=${line:0:2}

		case $XY in
			"##")
				BRANCH=${line:3}
				;;
			" M")
				_M=$[_M+1]
				;;
			" D")
				_D=$[_D+1]
				;;
			"??")
				UNTRACKED=$[UNTRACKED+1]
				;;
			"M ")
				M_=$[M_+1]
				;;
			"D ")
				D_=$[D_+1]
				;;
			"A ")
				A_=$[A_+1]
				;;
		esac

	done < <(git status --porcelain -b 2> /dev/null)



# indexed
	local A=$[A_]
	local B=$[M_]
	local C=$[D_]
	local D=0
# working directory
	local E=$[UNTRACKED]
	local F=$[_M]
	local G=$[_D]
	local H=0


	local CYAN="\[\033[0;36m\]"
	local       GREEN="\[\033[0;32m\]"

	local LIGHT_GREEN="\[\033[1;32m\]"
	local   LIGHT_RED="\[\033[1;31m\]"
	local     DEFAULT="\[\033[0m\]"

	if [[ -z $BRANCH ]]; then
		echo ""
	else
		local GITINFO="$GREEN$BRANCH"

		if [ $A -gt 0 -o $B -gt 0 -o $C -gt 0 ]; then
			GITINFO="$GITINFO $LIGHT_GREEN+$A ~$B -$C";
			if [ $E -gt 0 -o $F -gt 0 -o $G -gt 0 ]; then
				GITINFO="$GITINFO $DEFAULT|";
			fi
		fi
		if [ $E -gt 0 -o $F -gt 0 -o $G -gt 0 ]; then
			GITINFO="$GITINFO $LIGHT_RED+$E ~$F -$G";
		fi

		echo "[$GITINFO${DEFAULT}]"
	fi
}


function git_status_prompt {
	local CYAN="\[\033[0;36m\]"
# OPTIONAL - if you want to use any of these other colors:
	local        BLUE="\[\033[0;34m\]"
	local         RED="\[\033[0;31m\]"
	local   LIGHT_RED="\[\033[1;31m\]"
	local       GREEN="\[\033[0;32m\]"
	local LIGHT_GREEN="\[\033[1;32m\]"
	local       WHITE="\[\033[1;37m\]"
	local  LIGHT_GRAY="\[\033[0;37m\]"
# END OPTIONAL
	local     DEFAULT="\[\033[0m\]"

#PS1="\u:\h:\w$BLUE\$(parse_git_branch)$DEFAULT\$ "

#if [ "$color_prompt" = yes ]; then
	GIT_STATUS=$(git_status)
#	PS1=$GIT_STATUS
    PS1="${debian_chroot:+($debian_chroot)}\[\033[0;37m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\] $GIT_STATUS\n\$ "
#else
#    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w$BLUE\$(parse_git_branch)$DEFAULT\n\$ "
#fi


}

PROMPT_COMMAND=git_status_prompt

