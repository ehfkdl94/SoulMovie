from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
import urllib.request
import io
import binascii
import pandas as pd

# df = pd.read_csv('./list/movielist_update.csv')
# print(df['referenceIdentifier'].head())

# def url_toImage(url):
#     bytes = urllib.request.urlopen(url).read()
#     return bytes
# print(1212)

# for url in df['referenceIdentifier'][:5]:
#     df['img'] = url_toImage(url)
#     print(url)
# print(33)

# print(df['img'].head())
# print(df.info())

# img = urllib.request.urlopen('http://file.koreafilm.or.kr/thm/02/00/00/91/TN_DPF000033.jpg').read()
# print(img)
# stream = io.BytesIO(data)
# img = Image.open(stream)
# draw = ImageDraw.Draw(img)
# font = ImageFont.truetype("arial.ttf",14)
# draw.text((0, 220),"This is a test11",(255,255,0),font=font)
# draw = ImageDraw.Draw(img)
# img.save("a_test.png")