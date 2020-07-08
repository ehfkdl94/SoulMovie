import urllib.request
from PIL import Image
from io import BytesIO
import time
import multiprocessing
import requests

# url = 'http://file.koreafilm.or.kr/thm/02/00/00/91/TN_DPF000033.jpg'
# time check
# start = time.time()
# 이미지 요청 및 다운로드
# urllib.request.urlretrieve(url, url.split('/')[-1])
# 이미지 다운로드 시간 체크
# print(time.time() - start)

# IO 모듈
# import io
# byte 단위로 파일 읽기
# with open("TN_DPF000033.jpg", "rb") as handle:
#     data = handle.read()
# 콘솔 표시
# print(data)

# with open("TN_DPF000033.jpg", "rb") as imageFile:
#     f = imageFile.read()
#     b = bytearray(f)
#     print(b[0])

# import base64

# with open("TN_DPF000033.jpg", "rb") as imageFile:
#     str = base64.b64encode(imageFile.read())
#     print(str)

