from urllib.request import urlopen
import urllib
import xml.etree.ElementTree as et
from xml.etree.ElementTree import parse
import csv

# csv 파일 생성
with open('./list/movielist.csv', 'w', newline='', encoding='utf-8') as csvfile:
    # column = [영화명, 영화명(영문), 개봉연도, 장르, 배우, 이미지주소]
    fieldnames = ['title', 'alternativeTitle', 'regDate', 'subjectCategory', 'person', 'referenceIdentifier']  
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    # 마지막 pageNo가 2381
    for page in range(2, 2382, 1):  # 2382
        url = 'http://175.125.91.94/openapi/service/rest/meta/KFApost?pageNo=' + str(page)

        url_open = urlopen(url)
        doc = parse(url_open)
        root = doc.getroot()
        # xml 구조에 따라 items 태그 선택
        items = root[1][0]

        title_list = []
        alternativeTitle_list = []
        regDate_list = []
        subjectCategory_list = []
        person_list = []
        referenceIdentifier_list = []

        for a in items:
            # None 값으로 인한 오류 방지 위해 삼항연산자
            title = a.find('title').text.upper() if a.find('title') is not None else " "
            alternativeTitle = a.find('alternativeTitle').text.upper() if a.find('alternativeTitle') is not None else " "
            regDate = a.find('regDate').text if a.find('regDate') is not None else ""
            subjectCategory = a.find('subjectCategory').text if a.find('subjectCategory') is not None else " "
            # person = a.find('person').text if a.find('person') is not None else " "
            # 등장인물 3인 이하로 줄이기
            s = a.find('person').text.split(',')[:3] if a.find('person') is not None else " "
            person = ''
            for i in range(len(s)):
                person += s[i] + ','
            person = person[:-1]
            referenceIdentifier = a.find('referenceIdentifier').text if a.find('referenceIdentifier') is not None else " "

            title_list.append(title)
            alternativeTitle_list.append(alternativeTitle)
            regDate_list.append(regDate)
            subjectCategory_list.append(subjectCategory)
            person_list.append(person)
            referenceIdentifier_list.append(referenceIdentifier)

        print(title_list)
        print(len(title_list))
        print(alternativeTitle_list)
        print(len(alternativeTitle_list))
        print(regDate_list)
        print(len(regDate_list))
        print(subjectCategory_list)
        print(len(subjectCategory_list))
        print(person_list)
        print(len(person_list))
        print(referenceIdentifier_list)
        print(len(referenceIdentifier_list))
        print('페이지 : ', page)

        for i in range(0, len(title_list), 1):
            writer.writerow({'title': title_list[i], 'alternativeTitle': alternativeTitle_list[i], 'regDate': regDate_list[i],
                            'subjectCategory': subjectCategory_list[i], 'person': person_list[i], 'referenceIdentifier': referenceIdentifier_list[i]
                            })