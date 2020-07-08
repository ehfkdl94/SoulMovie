import pandas as pd
import urllib.request
from urllib.error import URLError, HTTPError
import cx_Oracle

df = pd.read_csv('./list/movielist.csv')
# 컬럼 확인
print(df.columns)

# regDate에서 연도만 추출 후 dtype 변경(string))
df['regDate'] = df['regDate'].apply(lambda x : x.split('-')[0])
print(df['regDate'])

# 중복영화 제거
df = df.drop_duplicates(["title", "referenceIdentifier"], keep="last")
print(df.info())

# 결측치 채우기
df = df.fillna(' ')
print(df.info())

# image를 byte로 변경
# def url_toImage(url):
#     bytes = urllib.request.urlopen(url).read()
#     return bytes

# for no, url in enumerate (df['referenceIdentifier']):
#     try:
#         df['img'] = url_toImage(url)
#     except HTTPError as e:
#         print(e)
#         print(url)
#         with open('error.txt', 'a', encoding='utf-8') as f:
#             f.write(url+'\n')
#     print(no)

# print(df['img'].head())
# print(df.info())

# 변경된 dataframe 저장
df.to_csv('./list/movielist_update.csv', index=False, encoding="utf-8")
