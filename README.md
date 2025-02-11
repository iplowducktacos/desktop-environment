# ☁️ Cloud Desktop Environment

My [daily driver](https://github.com/users/sabrehagen/packages/container/package/desktop-environment) on the cloud and on desktop.

![desktop](https://i.imgur.com/yv34lxO.png)
![desktop](https://i.imgur.com/Mi40odG.png)
![desktop](https://i.imgur.com/LZvxAnW.jpg)
![desktop](https://i.imgur.com/jm4RrKw.jpg)
![desktop](https://i.imgur.com/C1eBDKX.jpg)
![desktop](https://i.imgur.com/cEBbzyu.png)

## Getting Started

The only dependency required is [Docker](https://docs.docker.com/install).

To run, clone the repository and start the environment.

```sh
# Clone desktop environment
git clone https://github.com/sabrehagen/desktop-environment

# Start desktop environment
./desktop-environment/docker/scripts/recycle.sh
```

## Project Goals

- [x] A computer wholly defined in code.
- [x] Only one command required to start from scratch.

## Keybindings

Inexhaustive list of keybindings. Check `~/.config/i3/config` for all available bindings.

### System Management

- Restart the desktop environment: `$mod+Shift+q`
- Lock screen: `$mod+slash`

### Window Focus and Movement

Vim-style bindings for focusing and moving windows.

- Focus left: `$mod+h`
- Focus down: `$mod+j`
- Focus up: `$mod+k`
- Focus right: `$mod+l`
- Move focused window left: `$mod+Shift+h`
- Move focused window down: `$mod+Shift+j`
- Move focused window up: `$mod+Shift+k`
- Move focused window right: `$mod+Shift+l`
- Resize gaps: `$mod+equal` and `$mod+Shift+equal`

### Workspace Management

- Create a new workspace: `$mod+n`
- Move the focused window to a new workspace: `$mod+Shift+n`
- Switch to adjacent workspace: `$mod+Control+h` or `$mod+Control+l`
- Switch to workspace n: `$mod+1` to `$mod+0`
- Switch to previous workspace: `$mod+minus`

### Application Launching

- Launch alacritty terminal: `$mod+return`
- Launch google chrome: `$mod+b`
- Launch vs code: `$mod+c`
- Launch discord: `$mod+d`
- Launch pcmanfm file manager: `$mod+e`
- Launch telegram: `$mod+t`
- Launch screenshot: `$mod+x`

### Monitor Management

- Move the focused window to the left monitor: `$mod+less`
- Move the focused window to the right monitor: `$mod+greater`

### Scratchpad

- Show gotop: `$mod+escape`
- Show terminal: `$mod+grave`
- Show volume: `$mod+v`
- Show wifi: `$mod+i`

## Running in the Cloud

Fork this repository, add your [ngrok auth token](https://dashboard.ngrok.com/login) to the repository secrets as `NGROK_AUTH_TOKEN`, run the [Deploy Desktop Environment](../../actions/workflows/deploy.yml) GitHub Actions workflow, and the desktop environment will be deployed to GitHub's Actions infrastructure. The access url will be printed in the output of the `Get URL` workflow step.

Fork the [cloud-computer/cloud-computer](https://github.com/cloud-computer/cloud-computer) repository to deploy the desktop environment to Google cloud.
