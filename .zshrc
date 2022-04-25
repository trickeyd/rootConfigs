# Adds fzf grep functionality
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey -s '^p' 'vim $(fzf)^M'

export ENV_KEY="Is3qwjOwgfmWwBXcQP54" 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"  
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig" 

stty -ixon

#default java8
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/home
export PATH=/opt/apache-maven-3.6.3/bin:$PATH 


export PATH="$HOME/platform-tools/:$PATH"
#export PATH=/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH 
export PATH="/usr/local/opt/ruby/bin:$PATH" 

export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
 
 
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

export NODE_ENV=development
export MAIL_API='7c5db383b74c8504426f0c3b18b923af-0470a1f7-5621fcd7'
export MAIL_DOMAIN='idiosync.co.uk'
export SECRET='3F*&Y23_6YSxBqM&z#4Ypn=Q!gCtNAM?'
export FACEBOOK_CLIENT_ID='294181707866936'
export FACEBOOK_CLIENT_SECRET='27b08023b7213b7d479f51d9433c2bca'
export GOOGLE_CLIENT_ID='786288721014-2v6r8mrjb88djp7bf9rrhu2tmeecahug.apps.googleusercontent.com'
export GOOGLE_CLIENT_SECRET='xMHEkBSRBp85G72f6uWZVdo5'
export MONGO_USERNAME='james'
export MONGO_PASSWORD='pizzapie'
export MONGO_DB_NAME='james_test'
export MONGO_ADDRESS='localhost'


export toMob='cd ~/projects/smallTalkMobile'
export toApi='cd ~/projects/smallTalkServer'
export toSocket='cd ~/projects/smallTalkSocketServer' 
export runApi='node ~/projects/smallTalkServer/src/server/main.js' 
export runSocket='node ~/projects/smallTalkSocketServer/src/main.js'
export runAll='sh ~/projects/small-talk-shared-server/scripts/runLocalServers.sh'
export killAll='sh ~/projects/small-talk-shared-server/scripts/killAll.sh'
export initMongo='mongo localhost:27017/james_test ~/projects/smallTalkServer/scripts/initMongo.js'
export deleteQuestions='mongo localhost:27017/james_test ~/projects/smallTalkServer/scripts/deleteQuestions.js'
export deleteFriends='mongo localhost:27017/james_test ~/projects/smallTalkServer/scripts/deleteFriends.js'
 

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

export MATCH_PASSWORD="GossApp"
export FASTLANE_USER="james@goss.com"
export FASTLANE_PASSWORD="d4061791D4."
export FIREBASE_CLI_TOKEN="1//03TSaP3Oon9tICgYIARAAGAMSNwF-L9Ire_sk8V76tzE2IqCCaIZuU6iWHCWsbCDZOmgs0Ajff-qkHo_1H813cDok0uMxGnL2kZA"
export FIREBASE_STAGING_APP_ID="1:312706686152:ios:6eca23f0c90c7ed75a99fd"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools 

function sshTo() {
  gcloud compute ssh jamestrickeyd@$1 
}
 

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/google-cloud-sdk/path.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/google-cloud-sdk/completion.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR=~/.nvm


eval "$(rbenv init -)" 

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi 
