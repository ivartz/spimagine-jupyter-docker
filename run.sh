#!/bin/bash

# Important: Provide access to the X screen by temporarily disabling controlled access using xhost command.
xhost +

docker run -it \
    -p 8888:8888 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd):/home \
    -e DISPLAY=unix$DISPLAY \
    spimagine_jupyter_docker
