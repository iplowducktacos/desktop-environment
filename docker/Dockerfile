FROM ubuntu:23.04

ARG DESKTOP_ENVIRONMENT_GITHUB_USER
ARG DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD
ARG DESKTOP_ENVIRONMENT_USER

ENV DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD $DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD
ENV EDITOR nano
ENV LANG en_US.UTF-8
ENV LANGUAGE $LANG
ENV LC_ALL $LANG
ENV LC_CTYPE $LANG
ENV SHELL /bin/zsh
ENV TERM xterm-256color
ENV USER $DESKTOP_ENVIRONMENT_USER
ENV TZ Australia/Sydney

ENV HOME /home/$USER

# Restore minimized distribution content e.g. man pages
RUN yes | unminimize

# Install locales and timezone data
RUN apt-get update -qq && \
  apt-get install -qq \
  locales \
  tzdata

# Generate locales
RUN locale-gen $LANG && \
  update-locale LC_ALL=$LC_ALL LANG=$LANG && \
  dpkg-reconfigure --frontend=noninteractive locales

# Set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  echo $TZ > /etc/timezone

# Install desktop environment core utilities
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq --fix-missing \
  acpi \
  alacritty \
  alsa-utils \
  apt-file \
  apt-utils \
  arandr \
  asciinema \
  autoconf \
  autorandr \
  bat \
  bc \
  build-essential \
  cmake \
  cmatrix \
  curl \
  dbus-x11 \
  dnsmasq \
  dnsutils \
  docker.io \
  exa \
  feh \
  fzf \
  ffmpeg \
  figlet \
  fonts-font-awesome \
  g++ \
  gcc \
  git \
  golang-go \
  gtk-theme-switch \
  gtk+3.0 \
  htop \
  i3 dunst- \
  i3blocks \
  iftop \
  iputils-ping \
  jq \
  keychain \
  ksnip \
  libnotify-bin \
  libnss3-tools \
  libterm-readkey-perl \
  lsb-release \
  maim \
  make \
  man-db \
  mpd \
  mpv \
  nano \
  ncdu \
  ncmpcpp \
  neovim \
  net-tools \
  netcat-openbsd \
  numlockx \
  openssl \
  openvpn \
  pavucontrol-qt \
  pcmanfm \
  perl \
  pipx \
  pulseaudio \
  pulseaudio-module-zeroconf \
  pulsemixer \
  python3 \
  python3-pip \
  ranger \
  redshift \
  ruby \
  slop \
  software-properties-common \
  ssh \
  sshpass \
  strace \
  stress \
  sudo \
  tig \
  tigervnc-scraping-server \
  tigervnc-standalone-server \
  tmux \
  transmission-cli \
  transmission-common \
  transmission-daemon \
  tree \
  unclutter-xfixes \
  vcsh \
  vim \
  wdiff \
  wmctrl \
  xauth \
  xautolock \
  xclip \
  xdotool \
  xinit \
  xinput \
  xorg \
  xsel \
  xserver-xorg \
  xterm \
  zathura \
  zsh && \
  apt-file update

# Install arc
RUN wget -O /usr/local/bin/arc -q https://github.com/mholt/archiver/releases/download/v3.5.0/arc_3.5.0_linux_amd64 && \
  chmod +x /usr/local/bin/arc

# Install aws cli
RUN pipx install awscli

# Install bandwhich
RUN curl -fsSL https://github.com/imsnif/bandwhich/releases/download/0.20.0/bandwhich-v0.20.0-x86_64-unknown-linux-musl.tar.gz | \
  tar -C /usr/local/bin -xzf -

# Install beekeeper studio
RUN wget -O beekeeper-studio.deb -q https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.10/beekeeper-studio_3.7.10_amd64.deb && \
  dpkg -i beekeeper-studio.deb && \
  rm beekeeper-studio.deb

# Install bluetuith
RUN go install github.com/darkhz/bluetuith@latest

# Install chrome
RUN apt-get update -qq && \
  apt-get install -qq \
  apt-transport-https \
  ca-certificates \
  gnupg \
  hicolor-icon-theme \
  libcanberra-gtk* \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libpulse0 \
  libv4l-0 \
  fonts-symbola \
  --no-install-recommends && \
  curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update -qq && \
  apt-get install -qq google-chrome-stable --no-install-recommends && \
  rm /etc/apt/sources.list.d/google.list && \
  wget -O /etc/fonts/local.conf -nv https://raw.githubusercontent.com/jessfraz/dockerfiles/master/chrome/stable/local.conf && \
  groupadd --system chrome

# Install discord
RUN wget -O discord.deb -qnv 'https://discordapp.com/api/download?platform=linux&format=deb' && \
  dpkg -i discord.deb || apt-get install -qq --fix-broken && \
  rm discord.deb

# Install dive docker image explorer
RUN wget -q -O dive.deb https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb && \
  dpkg -i dive.deb && \
  rm dive.deb

# Install docker-compose
RUN curl -fsSL "https://github.com/docker/compose/releases/download/1.25.0-rc1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

# Install dunst
RUN apt-get update -qq && \
  apt-get install -qq libnotify-dev libxss-dev && \
  git clone https://github.com/sabrehagen/dunst /opt/dunst && \
  cd /opt/dunst && \
  make all && \
  make install

# Install gotop
RUN wget -q -O gotop.deb https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.deb && \
  dpkg -i gotop.deb && \
  rm gotop.deb

# Install gping
RUN wget -q -O gping.tar.gz https://github.com/orf/gping/releases/download/gping-v1.14.0/gping-Linux-x86_64.tar.gz && \
  tar xf gping.tar.gz gping && \
  install gping /usr/local/bin && \
  rm gping.tar.gz

# Install i3lock
RUN apt-get update -qq && \
  apt-get install -qq \
  autoconf \
  gcc \
  make \
  pkg-config \
  libpam0g-dev \
  libcairo2-dev \
  libfontconfig1-dev \
  libxcb-composite0-dev \
  libev-dev \
  libx11-xcb-dev \
  libxcb-xkb-dev \
  libxcb-xinerama0-dev \
  libxcb-randr0-dev \
  libxcb-image0-dev \
  libxcb-util-dev \
  libxcb-xrm-dev \
  libxkbcommon-dev \
  libxkbcommon-x11-dev \
  libjpeg-dev && \
  git clone --depth 1 https://github.com/Raymo111/i3lock-color /opt/i3lock && \
  cd /opt/i3lock && \
  sed -i 's/Num Lock//' i3lock.c && \
  sed -i 's/wrong!/auth failed/' unlock_indicator.c && \
  ./build.sh && \
  ./install-i3lock-color.sh

# Install i3 extras
RUN apt-get update -qq && \
  apt-get install -qq python3-i3ipc && \
  pipx install i3-resurrect==1.4.2 && \
  pipx install i3altlayout==1.1.1 && \
  pipx install i3-workspace-names-daemon && \
  sed -i s/'?'/''/ ~/.local/pipx/venvs/i3-workspace-names-daemon/lib/python3.11/site-packages/i3_workspace_names_daemon.py && \
  git clone --depth 1 https://github.com/s-urbaniak/i3-focus-last ~/.config/i3/i3-focus-last && \
  cd ~/.config/i3/i3-focus-last && \
  git clone --depth 1 https://github.com/dmedvinsky/gsimplecal /opt/gsimplecal && \
  cd /opt/gsimplecal && \
  ./autogen.sh && \
  ./configure --enable-gtk2 && \
  make && \
  make install

# Install invidtui
RUN go install github.com/darkhz/invidtui@latest

# Install jobber
RUN wget -O jobber.deb -q https://github.com/dshearer/jobber/releases/download/v1.4.4/jobber_1.4.4-1_amd64.deb && \
  dpkg -i jobber.deb || apt-get install -qq --fix-broken && \
  rm jobber.deb

# Install jump directory navigator
RUN wget -q -O jump.deb https://github.com/gsamokovarov/jump/releases/download/v0.30.1/jump_0.30.1_amd64.deb && \
  dpkg -i jump.deb && \
  rm jump.deb

# Install kasmvnc
# RUN apt-get install -qq libhash-merge-simple-perl libswitch-perl libyaml-tiny-perl ssl-cert && \
#   wget -q -O kasmvnc.deb https://github.com/kasmtech/KasmVNC/releases/download/v1.1.0/kasmvncserver_focal_1.1.0_amd64.deb && \
#   dpkg -i kasmvnc.deb && \
#   rm kasmvnc.deb

# Install kdenlive
RUN apt-get update -qq && \
  apt-get install -qq \
  frei0r-plugins \
  kde-style-breeze \
  kdenlive \
  knewstuff-dialog \
  mediainfo \
  --no-install-recommends

# Install lazyvim
RUN git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim && \
  rm -rf ~/.config/nvim/.git && \
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')_Linux_x86_64.tar.gz" && \
  tar xf lazygit.tar.gz lazygit && \
  install lazygit /usr/local/bin

# Install mopidy
RUN mkdir -p /etc/apt/keyrings && \
  wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg && \
  wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list && \
  apt-get update -qq && \
  apt-get install -qq mopidy && \
  pip3 install Mopidy-Tidal --break-system-packages

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

# Install novnc
RUN git clone --depth 1 https://github.com/cloud-computer/noVNC.git /opt/noVNC && \
  git clone --depth 1 https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# Install picom
RUN apt-get update -qq && \
  apt-get install -qq libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libpcre3-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev && \
  git clone --depth 1 https://github.com/yshui/picom /opt/picom && \
  cd /opt/picom && \
  meson setup --buildtype=release build && \
  ninja -C build && \
  install build/src/picom /usr/local/bin

# Install pywal
RUN pipx install pywal

# Install resucetime time tracker
RUN wget -O rescuetime.deb -nv https://www.rescuetime.com/installers/rescuetime_current_amd64.deb && \
  dpkg -i rescuetime.deb || apt-get install -qq --fix-broken && \
  rm rescuetime.deb

# Install whatsdesk
RUN wget -O whatsdesk.deb -nv https://zerkc.gitlab.io/whatsdesk/whatsdesk_0.3.9_amd64.deb && \
  dpkg -i whatsdesk.deb && \
  rm whatsdesk.deb

# Install speedtest
RUN pipx install speedtest-cli

# Install telegram
RUN curl -fsSL https://telegram.org/dl/desktop/linux | \
  tar -C /opt -xJf -

# Install timeago
RUN wget -O /usr/local/bin/timeago -nv https://raw.githubusercontent.com/sabrehagen/timeago/master/timeago && \
  chmod +x /usr/local/bin/timeago

# Install tldr
RUN pipx install tldr

# Install vs code, vs live share dependencies, shfmt extension dependency, and vs-wal
RUN wget -O code.deb -nv https://go.microsoft.com/fwlink/?LinkID=760868 && \
  apt-get install -qq ./code.deb && \
  rm code.deb && \
  apt-get install -qq libicu[0-9][0-9] libkrb5-3 zlib1g libsecret-1-0 desktop-file-utils x11-utils && \
  wget -O /usr/local/bin/shfmt -nv https://github.com/mvdan/sh/releases/download/v3.2.0/shfmt_v3.2.0_linux_amd64 && \
  chmod +x /usr/local/bin/shfmt

# Install warnai
RUN apt-get update -qq && \
  apt-get install -qq inkscape optipng xfconf && \
  git clone --depth 1 https://github.com/reorr/warnai /opt/warnai && \
  sed -i '/notify-send/d' /opt/warnai/warnai

# Install warpd
RUN git clone --depth 1 https://github.com/rvaiya/warpd /opt/warpd && \
  cd /opt/warpd && \
  make && \
  make install

# Install xava
RUN apt-get update -qq && \
  apt-get install -qq \
  libasound2-dev \
  libfftw3-dev \
  libiniparser1 \
  libpulse-dev \
  libsdl2-dev \
  libx11-dev && \
  git clone --depth 1 https://github.com/nikp123/xava && \
  mkdir xava/build && \
  cd xava/build && \
  cmake .. -DCMAKE_BUILD_TYPE=Debug -DINCLUDE_DIRS=lib/iniparser/src -DCMAKE_INSTALL_PREFIX=/usr -DWAYLAND=OFF && \
  make -j$(nproc) && \
  make install && \
  cp /usr/lib/xava/out_x11_cairo.so /usr/lib/xava/out_x11_opengl.so && \
  rm -rf ../../xava

# Install yarn
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && \
  apt-get install -qq yarn

# Install yarn based utilities
RUN yarn global add \
  clipboard-cli \
  diff-so-fancy \
  github-email \
  http-server \
  imgur-uploader-cli \
  localtunnel \
  nativefier \
  nodemon \
  rebase-editor

# Configure openvpn
RUN mkdir -p $HOME/.config/openvpn && \
  mknod $HOME/.config/openvpn/tun c 10 200 && \
  chmod 600 $HOME/.config/openvpn/tun

# Configure password-less sudo for the sudo group
RUN echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# Configure X11 permissions and touchpad tap to click
RUN sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config && \
  echo needs_root_rights=yes >> /etc/X11/Xwrapper.config && \
  chmod u+s /usr/bin/xinit && \
  mkdir -p /etc/X11/xorg.conf.d && \
  echo 'Section "InputClass"\n Identifier "touchpad"\n MatchIsTouchpad "on"\n Driver "libinput"\n Option "Tapping" "on"\n Option "libinput Accel Speed" "0.5"\nEndSection' > /etc/X11/xorg.conf.d/90-touchpad.conf

# Create a non-root user for safe operation
RUN userdel -r ubuntu && \
  useradd \
  --create-home \
  --groups audio,chrome,docker,input,pulse-access,shadow,sudo,tty,video \
  --shell /bin/zsh \
  $USER

# Set non-root user password
RUN sed -i "s;^$USER:[^:]*;$USER:$DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD;" /etc/shadow

# Take ownership of user's home directory and applications
RUN chown -R $USER:$USER $HOME /opt

# Become desktop environment user
USER $USER
WORKDIR $HOME

# Clone the desktop environment
RUN git clone https://github.com/sabrehagen/desktop-environment

# If the DOTFILES_CACHEBUST build arg is supplied, rebuild from static dotfiles onwards
ARG DOTFILES_CACHEBUST
RUN DOTFILES_CACHEBUST=$DOTFILES_CACHEBUST echo "Building from dotfiles..."

# Clone user dotfiles or fallback to sabrehagen dotfiles
RUN vcsh clone https://github.com/sabrehagen/dotfiles

# Bootstrap dotfiles
RUN $HOME/.dotfiles-bootstrap.sh

# Record container build information
ARG DESKTOP_ENVIRONMENT_CONTAINER_BUILD_DATE
ENV DESKTOP_ENVIRONMENT_CONTAINER_BUILD_DATE $DESKTOP_ENVIRONMENT_CONTAINER_BUILD_DATE
ARG DESKTOP_ENVIRONMENT_CONTAINER_GIT_SHA
ENV DESKTOP_ENVIRONMENT_CONTAINER_GIT_SHA $DESKTOP_ENVIRONMENT_CONTAINER_GIT_SHA
ARG DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME
ENV DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME $DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME
