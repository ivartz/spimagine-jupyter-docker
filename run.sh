#!/bin/bash

xhost +

docker run -it \
    -p 8888:8888 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd):/home \
    -e DISPLAY=unix$DISPLAY \
    spimagine_docker
