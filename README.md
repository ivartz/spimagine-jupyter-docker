# spimagine-jupyter-docker
spimagine Python volume rendering on CPU with Jupyter notebook

# Example
See [example/Example.ipynb](https://github.com/ivartz/spimagine-jupyter-docker/tree/master/example/Example.ipynb) that uses spimagine to visualize a 4D numpy array. The included keyframe editor is then used for rendering multiple images to a folder. Lastly, ffmpeg is used to create a .gif animation from the images, resulting in ![](example/rendering.gif "an animation of the dynamic contents of the 4D numpy array (t, z, y, x)").

# Build
```bash
bash build.sh
```

# Run
On the computer with X session (echo $DISPLAY should give a number).
```bash
bash run.sh
```
The directory from which you do this command becomes the /home directory within the container. After successfull build, run.sh can be placed in f. ex. /usr/local/bin for system-wide access after:
```bash
sudo cp run.sh /usr/local/bin/spimagine-jupyter-docker
sudo chown $USER:$USER /usr/local/bin/spimagine-jupyter-docker
sudo chmod u+x,g+x /usr/local/bin/spimagine-jupyter-docker
```
Then run with
```bash
cd <preferred_directory>
spimagine-jupyter-docker
```
- Copy the corresponding part in the startup log: 8888/?token=77cac9853b36e2d71f0466c5801149fbe15f43665d90bb30
- Open the notebook with the URL localhost:8888/?token=77cac9853b36e2d71f0466c5801149fbe15f43665d90bb30

