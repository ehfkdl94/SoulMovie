import pandas as pd
import cx_Oracle
import io

df1 = pd.read_csv('./list/movielist_update.csv')

# 컬럼들의 dtype 변경(string)
def change_dtype(columns, dtype):
    df1[columns] = df1[columns].astype(dtype)
    return df1[columns]
    
change_dtype(['title', 'alternativeTitle', 'regDate', 'subjectCategory', 'person', 'referenceIdentifier' ],  str)
print(df1.info())
print(df1.tail())

# Oracle 삽입
rows = [tuple(x) for x in df1.to_records(index=False)]
# con = cx_Oracle.connect('kfq20/1234@192.168.99.100:32764/xe', encoding="utf-8")
con = cx_Oracle.connect('kfq14/1234@1.234.5.158:32764/xe', encoding="utf-8")
cursor = con.cursor()

cursor.execute("DELETE FROM MOVIE")
cursor.executemany("INSERT INTO MOVIE (MOVIE_CODE , MOVIE_TITLE , MOVIE_ALTERNATIVETITLE , MOVIE_DATE , MOVIE_GENRE , MOVIE_ACTOR , MOVIE_IMG ) VALUES (SEQ_MOVIE_CODE.NEXTVAL, :1, :2, :3, :4, :5, :6)" , rows)            
# cursor.executemany("INSERT INTO MOVIE (NO, TITLE, ALTERNATIVETITLE, REGDATE, SUBJECTCATEGORY, PERSON, REFERENCEIDENTIFIER) VALUES (SEQ_NO.NEXTVAL, :1, :2, :3, :4, :5, :6)" , rows)            
con.commit()