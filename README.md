# Pi-Radio
Bash script to start radio on a raspberry pi with a button. 

## SYSTEMD

- Copy radio.service file in the `/etc/systemd/user/` directory
- systemctl --user start radio.service

## TODO

- Rewrite script to handle gpio interrupt to avoid while loop
