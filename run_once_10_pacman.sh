#!/bin/sh
set -eu
IFS=$'\n\t'

case ${OSTYPE:-} in linux*)
  if command -v pacman &> /dev/null; then
    echo "Updating pacman repository"
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm \
      atuin \
      bandwhich \
      bat \
      direnv \
      fd \
      fzf \
      git \
      github-cli \
      git-delta \
      jq \
      just \
      ripgrep \
      systemd-resolvconf \
      sccache \
      starship \
      wireguard-tools \
      zsh \
      zsh-autosuggestions \
      zsh-completions \
      zsh-syntax-highlighting

    echo "Enable systemd-resolved"
    sudo systemctl enable systemd-resolved
    sudo systemctl start systemd-resolved

    echo "Set bandwhich capabilities"
    sudo setcap "cap_sys_ptrace,cap_dac_read_search,cap_net_raw,cap_net_admin+ep" /usr/bin/bandwhich

    echo "Change default shell"
    default_shell=$(getent passwd $LOGNAME | cut -d: -f7)
    if [ "${default_shell}" != "/usr/bin/zsh" ]; then
      chsh -s /usr/bin/zsh
    fi
  fi
esac
