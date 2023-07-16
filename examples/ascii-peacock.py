#!/usr/bin/env python
import sys
# start of your script
import matplotlib.pyplot as plt
import requests
from PIL import Image
import numpy as np
import subprocess
#import tempfile

url = "https://media.inkscape.org/static/images/inkscape-logo.svg"
headers = {'User-Agent': 'Jaceks super cool bot'}
r = requests.get(url,  headers=headers)

open('C:/Users/jacek/temp/ascii_image.svg', 'wb').write(r.content)

cmd = 'inkscape --batch-process --actions="export-filename:C:/Users/jacek/temp/ascii_image.png;export-do" C:/Users/jacek/temp/ascii_image.svg' 
subprocess.call(cmd, shell=True)

img = Image.open('C:/Users/jacek/temp/ascii_image.png')

width, height = img.size
aspect_ratio = height/width
new_width = 100
new_height = aspect_ratio * new_width * 0.55
img = img.resize((new_width, int(new_height)))
img = img.convert('L')
pixels = img.getdata()
chars = [".", "S", "#", "&", "@", "€", "%", "*", "!", ":", " "]
new_pixels = [chars[pixel//25] for pixel in pixels]
new_pixels = ''.join(new_pixels)

new_pixels_count = len(new_pixels)
ascii_image = [new_pixels[index:index + new_width] for index in range(0, new_pixels_count, new_width)]

fig, ax = plt.subplots()
xpoints = np.array([0, 40])
ypoints = np.array([- 20, 0])
plt.plot(xpoints, ypoints, linestyle='None')
plt.axis('equal')
plt.grid(False)
plt.axis('off')

for i in range(len(ascii_image)):
  plt.text(0, -0.4 * i, ascii_image[i], family = 'monospace', size = 4)

# end of your script
fig.savefig(sys.argv[1], format='svg', dpi=1200)
