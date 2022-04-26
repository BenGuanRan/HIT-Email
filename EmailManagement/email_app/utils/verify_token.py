# 验证token是否过期
from django.core import signing
import time
deadtime = 3600*6 # 最长权限时间为6h

def verify_token(token):
    try:
        src_token = signing.loads(token)
        login_time = src_token.split("&")[1]
    except:
        return False
    # 获取当前时间
    timeStamp = int(time.time())
    print(timeStamp-int(login_time))
    if timeStamp-int(login_time) > deadtime:
        return False
    return True