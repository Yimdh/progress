from datetime import datetime
from datetime import timedelta

start = datetime(2020,1,1,0,0)
end = datetime(2020,1,14,0,0)
while start <= end:
    print(start)
    start=start+timedelta(days=7)
