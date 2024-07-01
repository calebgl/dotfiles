# Dotfiles

This repository manages my personal development environment configuration for `archlinux`. It utilizes `ansible-playbook` to streamline the setup process.

## Requirements

- `curl` (optional)
- `git`

```
sudo pacman -Sy curl git
```

> This configuration is specifically designed and tested on `archlinux`. While some elements might work on other distributions, extensive modifications may be necessary.

## Installation

### Automatic

This is the easiest way to install my dotfiles:

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/calebgl/dotfiles/main/bin/dotfiles)"
```

> During the execution you will be prompted to enter your password, this will be needed for certain tasks like package installation and configuration file manipulation.

The script attempts to decrypt certain variables within `group_vars/all.yaml` using a secret file. If this file is not found, the script will continue execution without decryption and those ansible tasks will fail.

### Manual

If you take this approach, you will need to install:

- `python`
- `python-watchdog`
- `ansible` and `ansible-galaxy`

Once they are all installed, you can continue with the next steps:

1. Download the repository
   
   ```
   git clone https://github.com/calebgl/dotfiles.git .dotfiles && cd .dotfiles
   ```
   
2. Execute `main.yaml` playbook

   ```bash
   # -K will ask for privileges (needed for installing system packages) 
   ansible-playbook main.yaml -K
   ```

   > You can edit the `default_roles` under `group_vars/all.yaml` if you don't need all packages or if you want to edit some other var.

## Customization

This repository provides a baseline configuration for my development environment. Feel free to customize the provided ansible playbooks and bash script according to your preferences. Explore the various configuration files within the repository to tailor the settings to your liking.

## Disclaimer

While this setup has been tested on my `archlinux` system, there's always a possibility of unexpected behavior. Proceed with caution and be prepared to troubleshoot any issues that may arise. Consider backing up your system before running the setup script, especially if you're new to `archlinux` or managing dotfiles with `ansible`.


## Todos

- [ ] Add arch setup

## Inspired by

This course provided valuable insights into efficient development environment configuration, which influenced my approach to setting up my dotfiles.

- [ThePrimeagen | Developer Productivity](https://frontendmasters.com/courses/developer-productivity/)

For more in-depth documentation, you can explore these repositories:

- [TechDufus](https://github.com/TechDufus/dotfiles)
- [ALT-F4-LLC](https://github.com/ALT-F4-LLC/dotfiles)

This repository is based on their configurations.
