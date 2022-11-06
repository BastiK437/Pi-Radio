# Pi-Radio
Bash script to start radio on a raspberry pi with a button. 

## SYSTEMD

- Copy radio.service file in the `/etc/systemd/user/` directory
- systemctl --user start radio.service
- Copy radio.sh to /usr/bin/

### Enable at boot

- `sudo loginctl enable-linger <username>`
- `systemctl --user enable radio.service`

## Dependencies

- sudo apt install gpiod
- sudo apt install mplayer

## TODO

- Rewrite script to handle gpio interrupt to avoid while loop
