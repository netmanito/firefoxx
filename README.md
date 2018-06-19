## X11 apps with docker (firefox) 

Edit Dockerfile variables

	$ docker build -t firefox .

Run Xquartz

	$ open -a XQuartz

Add xhost permissions

	$ xhost + 127.0.0.1

Run docker image

	docker run -it -e DISPLAY=docker.for.mac.localhost:0 -v /tmp/.X11-unix:/tmp/.X11-unix firefox

