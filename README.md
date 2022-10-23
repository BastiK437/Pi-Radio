# Pi-Radio
Bash script to start radio on a raspberry pi with a button. 

## SYSTEMD

- Copy radio.service file in the `/etc/systemd/user/` directory
- systemctl --user start radio.service

### Enable at boot

- `sudo loginctl enable-linger <username>`
- `systemctl --user enable radio.service`

## TODO

- Rewrite script to handle gpio interrupt to avoid while loop
