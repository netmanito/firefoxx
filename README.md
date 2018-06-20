## X11 apps with docker (firefox) 

Edit Dockerfile variables

	$ docker build -t firefox .

Run Xquartz

	$ open -a XQuartz

Open XQuartz -> Preferences from the menu bar. Go to the last tab, Security, and enable both "Allow connections from network clients" and "Authenticate connections" checkboxes and restart XQuartz.

Add xhost permissions

	$ xhost + 127.0.0.1

Run docker image

	docker run -it -e DISPLAY=docker.for.mac.localhost:0 -v /tmp/.X11-unix:/tmp/.X11-unix firefox

