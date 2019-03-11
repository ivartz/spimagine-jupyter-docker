# spimagine-jupyter-docker
spimagine Python volume rendering on CPU with Jupyter notebook

# Example
See [example/Example.ipynb](https://github.com/ivartz/spimagine-jupyter-docker/tree/master/example/Example.ipynb) that uses spimagine to visualize a 4D numpy array. The included keyframe editor is then used for rendering multiple images to a folder. Lastly, ffmpeg is used to create a .gif animation from the images, resulting in ![](https://github.com/ivartz/spimagine-jupyter-docker/tree/master/example/rendering.gif "an animation of the dynamic contents of the 4D numpy array (t, z, y, x)").
