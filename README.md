# linux-bash-shell-scripts

various linux shell bash scripts used for automating processes/manual tasks

Add Color to your Prompt Linux Bash Shell

#to check the default prompt shell colors/settings, we can do echo $PS1

#The BASH color codes:
export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export blue="\033[1;34m"
export purple="\033[1;35m"
export cyan="\033[1;36m"
export grey="\033[0;37m"
export reset="\033[m"

#we can create a .color file and copy the color codes there

source ~/.color

#now the color are environment variables inside our shell available to us

#now we are setting the prompt shell colors. \u for username, @, \h for the hostname; \w for working directory, \$ for the prompt color to be cyan, and then reset back to the shell defaults
export PS1="${cyan}\u@\h ${grey}\w ${cyan}\$ $reset"

#we can edit the .bash_profile to persist our changes

#move into the home directory
cd

#edit the .bash_profile

vim .bash_profile

#jump below the # User specific environment and startup programs

source ~/.color

#export our PS1 variable to be available to our shell and all other sub-shells
export PS1="${cyan}\u@\h ${grey}\w ${cyan}\$ $reset"
