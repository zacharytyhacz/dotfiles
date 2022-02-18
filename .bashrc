parse_git_branch() {                                                                                 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'                              
}                                                                                                    

export PS1="\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch) \n> "

export GIT_EDITOR=vim
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export BROWSER="brave"

alias src="source ~/.bash_profile"
alias l="ls -al"

alias rm="rm -i"

alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"

# list
alias l="exa --long --all --classify --modified --sort type" 
alias ll="l" 
alias lll="l --git" 
alias ls="exa --oneline --classify" 
alias lr="exa --tree --classify --recurse --level 2" 
alias lrt="ll -s modified"

# like git checkout <branch> <path file>                                                             
alias gr="git restore -SW -s"                                                                        
alias gd="git diff --minimal"                                                                        
alias gdc="git diff --cached"                                                                        
alias gs="git status"                                                                                
alias gb="git branch"                                                                                
alias gc="git checkout"                                                                              
                                                                                                     
# list and sort my latest branches i worked on                                                       
alias gbb="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
                                                                                                     
# git add patch                                                                                      
alias gap="git add -p"                                                                               
alias gp="git push"                                                                                  
                                                                                                     
# unstage files                                                                                      
alias gu="git restore --staged"                                                                      
                                                                                                     
# search branches                                                                                    
alias b="git branch --all | ack "                                                                    
                                                                                                     
# better gitlog                                                                                      
alias gitlog="git log --stat --pretty=short --graph --show-signature"                                
                                                                                                     
# git log history shown as diffs of a file                                                           
alias gitlogf="git log -p --follow --"                                                               
                                                                                                     
# see commits only on this branch                                                                    
alias mylog="git log --stat --pretty=short --graph --first-parent"                                   
                                                                                                     
# see full file commit history                                                                       
alias gitblame="git log -p -M --follow --stat --"

alias ep="cd ~/Projects/EP/ep-application"

alias startmongo="docker run -d -v mongodata:/data/db -e MONGO_INITDB_DATABASE=ESDEV -p 27017:27017 --name mongodev mongo || docker start mongodev"
alias mongo="docker exec -it mongodev mongo"

alias v="vim ."

source ~/.git-completion.bash
source ~/.servers

set -o vi

echo ""
cal
echo ""
