#!/bin/sh

srv_cfg_dir="$HOME/.config/systemd/user/"
srv_cfg_fn="$srv_cfg_dir/emacs.service"


cat <<EOF > $srv_cfg_fn
[Unit]
Description=Emacs text editor
Documentation=info:emacs man:emacs(1) https://gnu.org/software/emacs/

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(kill-emacs)"
Environment=SSH_AUTH_SOCK=%t/keyring/ssh
Restart=on-failure

[Install]
WantedBy=default.target
EOF

# Enable the service only for the user
systemctl enable --user emacs

# Start the service
systemctl start --user emacs

