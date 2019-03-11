FROM pkienzle/opencl_docker
# Inheriting from a docker environment where opencl 
# is installed for Intel CPUs and GPUs, AMD GPUs and Nvidia GPUs.

# The goal of this environment is to run spimagine
# using x11 forwarding between docker environment
# and host environment, based on CPU-only 
# Intel OpenCL and standard CPU OpenGL .

# The motivation was that the hardware with
# most RAM available to the author was
# a computer  with no supported
# OpenCL CUDA NVidia GPU (too old).
# A lot of ram is needed to load 4D numpy arrays into ram
# for visualization and rendering with spimagine.
# This the computer with outdated GPU would be best fit
# for the task, given such a docker environment.
# Installing necessary libraries.

# First a basic jupyter notebook install.

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends apt-utils
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
            curl \
            xz-utils \
            build-essential \
            libsqlite3-dev \
            libreadline-dev \
            libssl-dev \
            ca-certificates \
            openssl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip

RUN pip3 install --no-cache-dir \
        ipykernel \
        jupyter

# Set up our notebook config.
COPY support/jupyter_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY support/jupyter_launch.sh /
RUN chmod +x /jupyter_launch.sh

# Install spimagine.

# libgl1-mesa-glx installs Mesa OpenGL .
# Since it is installed in a docker environment
# with no GPU made available, it is forced to use
# CPU, which is what we want.

# qtbase5-dev installs non-python specific
# qt libraries. I am not shure if this
# is necessary.

# libxcb-xinerama0-dev is the package that
# makes x11 forwarding from the docker 
# environment to standard linux x11 
# enviornment, possible.

# Install ffmpeg and spimagine.
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libgl1-mesa-glx qtbase5-dev libxcb-xinerama0-dev ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install spimagine scikit-tensor-py3 tifffile

# IPython
EXPOSE 8888

WORKDIR "/home"

CMD ["/jupyter_launch.sh"]
