from pyathena import connect
import pandas as pd
import datetime
from dateutil.relativedelta import relativedelta
import shutil
import os

conn = connect(aws_access_key_id='AKIA2CA5RKIYU2ZI2CRH',
               aws_secret_access_key='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',
               s3_staging_dir='s3://ridi-data-emr/athena-output/',
               region_name='ap-northeast-2')

#file=input("sql 파일명을 입력하세요 : ")
file='sql'
output_dir= os.path.join(os.getcwd(),file.split('.')[0]+'_output')
print('Generated output dir : '+output_dir)

#start_date=input("시작일을 입력하세요 : ")
start='20200101'
end='20200110'
#end_date=input("마지막일을 입력하세요 : ")
shutil.rmtree(output_dir,ignore_errors=True, onerror=None)
os.makedirs(output_dir)
f = open(os.path.join(os.getcwd(),file), 'r')
sql = f.read()
f.close()
sql.replace('\n',' ')
start_date=datetime.datetime.strptime(start, '%Y%m%d')
end_date=datetime.datetime.strptime(end, '%Y%m%d')

#print(start_date)
#print(end_date)
end = datetime.datetime(2020, 1, 1, 0, 0)
while end <= end_date:
    end = end+relativedelta(day=7)
    print(end)
    if(end <= end_date):
        print('end')

  #  e = s+relativedelta(day=7)
   # print(s.strftime('%Y-%m-%d'))
   # print(e)
    #s = e
   # print(s.strftime('%Y-%m-%d'))




print('Process started')