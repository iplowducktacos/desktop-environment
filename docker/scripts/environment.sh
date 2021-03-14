REPO_ROOT=$(dirname $(readlink -f $0))/../..

DESKTOP_ENVIRONMENT_USER=$USER
DESKTOP_ENVIRONMENT_CONTAINER_IMAGE=desktop-environment
DESKTOP_ENVIRONMENT_CONTAINER_NAME=${DESKTOP_ENVIRONMENT_CONTAINER_NAME-$DESKTOP_ENVIRONMENT_CONTAINER_IMAGE}
DESKTOP_ENVIRONMENT_GITHUB_USER=$(git --git-dir $REPO_ROOT/.git remote get-url origin | sed -E  's;.*github.com.(.*)/.*;\1;')
DESKTOP_ENVIRONMENT_REGISTRY=${DESKTOP_ENVIRONMENT_REGISTRY-$DESKTOP_ENVIRONMENT_GITHUB_USER}

# Desktop environment repository information
echo export DESKTOP_ENVIRONMENT_CONTAINER_IMAGE=$DESKTOP_ENVIRONMENT_CONTAINER_IMAGE
echo export DESKTOP_ENVIRONMENT_CONTAINER_NAME=$DESKTOP_ENVIRONMENT_CONTAINER_NAME
echo export DESKTOP_ENVIRONMENT_CONTAINER_TAG=${DESKTOP_ENVIRONMENT_CONTAINER_TAG-$(git --git-dir $REPO_ROOT/.git rev-parse --abbrev-ref HEAD)}
echo export DESKTOP_ENVIRONMENT_GITHUB_TOKEN=$DESKTOP_ENVIRONMENT_GITHUB_TOKEN
echo export DESKTOP_ENVIRONMENT_GITHUB_USER=$DESKTOP_ENVIRONMENT_GITHUB_USER
echo export DESKTOP_ENVIRONMENT_REGISTRY=$DESKTOP_ENVIRONMENT_REGISTRY

# Desktop environment user configuration
DESKTOP_ENVIRONMENT_USER_HOME=/home/$DESKTOP_ENVIRONMENT_USER
echo export DESKTOP_ENVIRONMENT_USER=$DESKTOP_ENVIRONMENT_USER
echo export DESKTOP_ENVIRONMENT_USER_HOME=$DESKTOP_ENVIRONMENT_USER_HOME
echo export DESKTOP_ENVIRONMENT_USER_ID=1000

# Desktop environment docker configuration
echo export DESKTOP_ENVIRONMENT_DOCKER_NETWORK=$DESKTOP_ENVIRONMENT_REGISTRY-$DESKTOP_ENVIRONMENT_CONTAINER_NAME

# Desktop environment application cache volumes
echo export DESKTOP_ENVIRONMENT_CACHE_BRAVE=$DESKTOP_ENVIRONMENT_USER_HOME/.cacheBraveSoftware
echo export DESKTOP_ENVIRONMENT_CACHE_CHROME=$DESKTOP_ENVIRONMENT_USER_HOME/.cache/google-chrome
echo export DESKTOP_ENVIRONMENT_CACHE_SSH=$DESKTOP_ENVIRONMENT_USER_HOME/.ssh
echo export DESKTOP_ENVIRONMENT_CACHE_TMUX=$DESKTOP_ENVIRONMENT_USER_HOME/.tmux
echo export DESKTOP_ENVIRONMENT_CACHE_YARN=$DESKTOP_ENVIRONMENT_USER_HOME/.cache/yarn
echo export DESKTOP_ENVIRONMENT_CACHE_ZOOM=$DESKTOP_ENVIRONMENT_USER_HOME/.cache/zoom
echo export DESKTOP_ENVIRONMENT_CACHE_ZSH=$DESKTOP_ENVIRONMENT_USER_HOME/.cache/zsh

# Desktop environment application state volumes
echo export DESKTOP_ENVIRONMENT_STATE_BRAVE=$DESKTOP_ENVIRONMENT_USER_HOME/.config/BraveSoftware
echo export DESKTOP_ENVIRONMENT_STATE_CHROME=$DESKTOP_ENVIRONMENT_USER_HOME/.config/google-chrome
echo export DESKTOP_ENVIRONMENT_STATE_CODE=$DESKTOP_ENVIRONMENT_USER_HOME/.config/Code
echo export DESKTOP_ENVIRONMENT_STATE_DISCORD=$DESKTOP_ENVIRONMENT_USER_HOME/.config/discord
echo export DESKTOP_ENVIRONMENT_STATE_FERDI=$DESKTOP_ENVIRONMENT_USER_HOME/.config/Ferdi
echo export DESKTOP_ENVIRONMENT_STATE_I3=$DESKTOP_ENVIRONMENT_USER_HOME/.config/i3/i3-resurrect
echo export DESKTOP_ENVIRONMENT_STATE_IRSSI=$DESKTOP_ENVIRONMENT_USER_HOME/.irssi/logs
echo export DESKTOP_ENVIRONMENT_STATE_JUMP=$DESKTOP_ENVIRONMENT_USER_HOME/.jump
echo export DESKTOP_ENVIRONMENT_STATE_MUSIKCUBE=$DESKTOP_ENVIRONMENT_USER_HOME/.config/musikcube/1
echo export DESKTOP_ENVIRONMENT_STATE_NCHAT=$DESKTOP_ENVIRONMENT_USER_HOME/.config/nchat
echo export DESKTOP_ENVIRONMENT_STATE_RESCUETIME=$DESKTOP_ENVIRONMENT_USER_HOME/.config/RescueTime.com
echo export DESKTOP_ENVIRONMENT_STATE_SIGNAL=$DESKTOP_ENVIRONMENT_USER_HOME/.config/Signal
echo export DESKTOP_ENVIRONMENT_STATE_SLACK=$DESKTOP_ENVIRONMENT_USER_HOME/.config/Slack
echo export DESKTOP_ENVIRONMENT_STATE_TELEGRAM=$DESKTOP_ENVIRONMENT_USER_HOME/.local/share/TelegramDesktop
echo export DESKTOP_ENVIRONMENT_STATE_X11=/tmp/.X11-unix
echo export DESKTOP_ENVIRONMENT_STATE_ZOOM=$DESKTOP_ENVIRONMENT_USER_HOME/.zoom

# Desktop environment user state volumes
echo export DESKTOP_ENVIRONMENT_USER_DOCUMENTS=$DESKTOP_ENVIRONMENT_USER_HOME/documents
echo export DESKTOP_ENVIRONMENT_USER_DOWNLOADS=$DESKTOP_ENVIRONMENT_USER_HOME/downloads
echo export DESKTOP_ENVIRONMENT_USER_GO=$DESKTOP_ENVIRONMENT_USER_HOME/go
echo export DESKTOP_ENVIRONMENT_USER_MUSIC=$DESKTOP_ENVIRONMENT_USER_HOME/music
echo export DESKTOP_ENVIRONMENT_USER_PICTURES=$DESKTOP_ENVIRONMENT_USER_HOME/pictures
echo export DESKTOP_ENVIRONMENT_USER_REPOSITORIES=$DESKTOP_ENVIRONMENT_USER_HOME/repositories
echo export DESKTOP_ENVIRONMENT_USER_TORRENTS=$DESKTOP_ENVIRONMENT_USER_HOME/torrents
echo export DESKTOP_ENVIRONMENT_USER_VIDEOS=$DESKTOP_ENVIRONMENT_USER_HOME/videos
