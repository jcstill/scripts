# Scripts
Some bash scripts to make my life easier. The tools I would expect to be helpful to anyone, though may need some modifications to work with your system. The scripts used by polybar should work without modification, but they are written for my machine so you get what you get, I guess.

### tools
command | functions
-|-
audiosink | Switch the default audio sink and move existing streams to new sink
calc | Calculator based originaly on the example from the arch wiki
crypt | Easy way to quickly encrypt or decrypt files
ec | Intercept a non-zero return code of the last program run
extract | Extract a wide range of compressed file types
i3lockctl.sh | My i3 lock configurations
i3timeout.sh | My i3 lock control script
ipinfo | Detailed information on an IP address or hostname in bash via https://ipinfo.io
launchpolybar.sh | Script to launch/relaunch polybar
macgen | Generate a random mac address while not being multicast or broadcast addresses
monitor | Combination of all the individual scripts I had to deal with displays
mousewake | Disable Mouse/Keyboard Wakeups from suspend
net-rec | Reset nmcli to dhcp and request address from dhcp server
pdftool | Tool to modify PDFs (basically a gs wrapper)
transfer | Upload a file to transfer.sh
wallpaper.sh | Set the wallpaper based on the monitors connected

### Scripts Used by my Polybar setup:
command | functions
-|-
calendar.sh | Show a small calendar using rofi
cpu.sh | Show current CPU usage as a percent
date.sh | Show today's date
mem.sh | Show current memory usage in GB
mousepower.sh | Show wireless mouse battery as a percent
powermenu.sh | Show power menu using rofi
systemp.sh | Show CPU and/or GPU temp
time.sh | Show current time
todobar.sh | Show remaining tasks from todo.py
