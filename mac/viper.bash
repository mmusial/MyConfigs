# ========================================
# install guide:
#   insert in ~/.bash_profile
# 	
#     source ~/MyConfigs/mac/viper.bash
# ========================================

SCRIPT="${BASH_SOURCE[0]}"
SCRIPTPATH="`dirname "${SCRIPT}"`"

# colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# git status in prompt
source $SCRIPTPATH/../git-status-prompt.bash

# git completion
# source ~/Projects/git/contrib/completion/git-completion.bash

