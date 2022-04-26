from django.shortcuts import render, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from email_app.models import Users
import json
from email_app.utils.get_post_data import getPostValues
from email_app.utils.send_email import sendEmail
from email_app.utils.create_verfy_code import createVerfyCode
from  email_app.utils.verify_token import verify_token
from  email_app.utils.test_IMAP import test_IMAP
from email_app.models import Users, DraftBox, HasSend, username_verifyCode, Token
import time
from django.core import signing # 用于加密token

# 视图函数
def hello(request):
    return HttpResponse(request.GET)

def home(request):
    return HttpResponse('后端api主页！')


# 登录
@csrf_exempt
def login(request):
    if request.method == 'POST':
        res = getPostValues(request.POST)
        print(res)
        if ('username' in res.keys()) and ('password' in res.keys()):
            try:
                conditions = {
                    "username": res['username'],
                    "password": res['password']
                }
                if len(Users.objects.filter(**conditions))>0:
                    # 生成token
                    timeStamp = int(time.time())
                    val = res['username']+'&' + str(timeStamp)
                    token = signing.dumps(val)
                    # 获取IMAP
                    IMAP = Users.objects.filter(**conditions).values()[0]['IMAP']
                    # 如果是非第一次登录

                    if len(Token.objects.filter(username=res['username'])) >0:
                        Token.objects.filter(username=res['username'])

                    else:
                        Token.objects.create(username=res['username'], loginTime=str(timeStamp), token=token)
                    return HttpResponse(json.dumps({
                        'msg':'登陆成功！',
                        'token':token,
                        'IMAP':IMAP
                    },ensure_ascii=False))
                else:
                    return HttpResponse('账号不存在或密码错误！')
            except:
                return HttpResponse('Error!')
            return HttpResponse(json.dumps(res))
    return HttpResponse('Error!')



# 发送验证码
@csrf_exempt # 使用@csrf_exempt装饰器，避开CsrfViewMiddleware的检测
def sendVerifyCode(request):
    if request.method == 'POST':
        res = getPostValues(request.POST)
        try:
            verifyCode = createVerfyCode()
            sendEmail('1755742107@qq.com', 'wjocdjymmnakcdbi', res['username'], str(verifyCode), '因迈尔邮箱验证码')
            res['verifyCode'] = verifyCode
            # 如果是第一次验证码
            if len(username_verifyCode.objects.filter(username=res['username'])) == 0:
                username_verifyCode.objects.create(username=res['username'], verifyCode=verifyCode)
            # 否则更新验证码
            else:
                username_verifyCode.objects.filter(username=res['username']).update(verifyCode=verifyCode)
        except:
            return HttpResponse('Error!')
    return HttpResponse(json.dumps(res))

# 注册
@csrf_exempt
def register(request):
    if request.method == 'POST':
        res = getPostValues(request.POST)
        if ('username' in res.keys()) and ('password' in res.keys()) and ('verifyCode' in res.keys()):
            try:
                conditions = {
                    "username": res['username'],
                    "password": res['password']
                }
                verifyCode = username_verifyCode.objects.filter(username=res['username'])[0].verifyCode
                if verifyCode != res['verifyCode']:
                    return HttpResponse('验证码错误！')
                if len(Users.objects.filter(**conditions))>0:
                    return HttpResponse('该账号已存在!')
                else:
                    Users.objects.create(username=res['username'], password=res['password'])
                    return HttpResponse('Success!')
            except:
                return HttpResponse('Error!')
            return HttpResponse(json.dumps(res))
    return HttpResponse('Incomplete parameters!!')

#暂存邮件
@csrf_exempt
def saveEmail(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    print(if_has_power)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'POST':
        date = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
        res = getPostValues(request.POST)
        if ('title' in res.keys()) and ('receiver' in res.keys()) and ('content' in res.keys()) and ('sender' in res.keys()):
            try:
                DraftBox.objects.create(title=res['title'], receiver=res['receiver'], content=res['content'], date=date, sender=res['sender'])
                return HttpResponse('Success!')
            except:
                return HttpResponse('Save error!')
        else:
            return HttpResponse('Incomplete parameters!')
    else:
        return HttpResponse('Error!')

# 已发送
@csrf_exempt
def saveHasSend(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    print(if_has_power)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'POST':
        date = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
        res = getPostValues(request.POST)
        if ('title' in res.keys()) and ('receiver' in res.keys()) and ('content' in res.keys()) and ('sender' in res.keys()):
            try:
                HasSend.objects.create(title=res['title'], receiver=res['receiver'], content=res['content'], sender=res['sender'], date=date)
                return HttpResponse('Success!')
            except:
                return HttpResponse('Save error!')
        else:
            return HttpResponse('Incomplete parameters!')
    else:
        return HttpResponse('Error!')

# 发送邮件
@csrf_exempt
def postEmail(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    print(if_has_power)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'POST':
        res = getPostValues(request.POST)
        print(res)
        if ('title' in res.keys()) and ('receiver' in res.keys()) and ('sender' in res.keys()) and\
                ('content' in res.keys()):
            if 'IMAP' not in res.keys() or res['IMAP'] == '':
                res['sender'] = '1755742107@qq.com'
                res['IMAP'] = 'wjocdjymmnakcdbi'
            try:
                sendEmail(res['sender'], res['IMAP'], res['receiver'], res['content'], res['title'])
                return HttpResponse('Success!')
            except:
                return HttpResponse('Send error!')
        else:
            return HttpResponse('Incomplete parameters!')
    else:
        return HttpResponse('Error!')

# 删除草稿箱
@csrf_exempt
def deleteEmail(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    print(if_has_power)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'POST':
        res = getPostValues(request.POST)
        if ('id' in res.keys()) and ('user' in res.keys()):
            try:
                # 查找id与user匹配的草稿并删除
                conditions={
                    'id': res["id"],
                    'sender': res['user']
                }
                DraftBox.objects.filter(**conditions).delete()
                return HttpResponse('Success!')
            except:
                return HttpResponse('Delete error!')
        else:
            return HttpResponse('Incomplete parameters!')
    else:
        return HttpResponse('Error!')

# 获取草稿箱存放的邮件
def getDraftBoxEmails(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'GET':
        if 'username' in request.GET.keys():
            try:
                conditions = {
                    "sender": request.GET['username']
                }
                print(conditions)
                res = DraftBox.objects.filter(**conditions).values()
                print(list(res))
                return HttpResponse(json.dumps(list(res),ensure_ascii=False))
            except:
                return HttpResponse('Search error!')
        else:
            return HttpResponse(json.dumps([]))


@csrf_exempt
# 绑定IMAP
def saveIMAP(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'POST':
        res = getPostValues(request.POST)
        if ('username' in res.keys()) and ('IMAP' in res.keys()):
            print(test_IMAP(res['username'], IMAP=res['IMAP']), 888)
            if not (test_IMAP(res['username'], IMAP=res['IMAP'])):
                return HttpResponse('Illegal IMAP!')
            try:
                Users.objects.filter(username=res['username']).update(IMAP=res['IMAP'])
                return HttpResponse('Success!')
            except:
                return HttpResponse('Save error!')
        else:
            return HttpResponse('Incomplete parameters!')
    else:
        return HttpResponse('Error!')


# 获取收件箱
def getEmails(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'GET':
        if 'username' in request.GET.keys():
            try:
                conditions = {
                    "receiver": request.GET['username']
                }
                res = HasSend.objects.filter(**conditions).values()
                return HttpResponse(json.dumps(list(res), ensure_ascii=False))
            except:
                return HttpResponse('Search error!')
        else:
            return HttpResponse(json.dumps([]))
# 获取发件箱
def getOutbox(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'GET':
        if 'username' in request.GET.keys():
            try:
                conditions = {
                    "sender": request.GET['username']
                }
                res = HasSend.objects.filter(**conditions).values()
                print(res)
                return HttpResponse(json.dumps(list(res), ensure_ascii=False))
            except:
                return HttpResponse('Search error!')
        else:
            return HttpResponse(json.dumps([]))
        
# 编辑草稿箱
@csrf_exempt
def editDraftbox(request):
    token = request.META.get("HTTP_TOKEN")
    if str(token) == 'None':
        return HttpResponse('请求头无token字段!')
    if_has_power = verify_token(token)
    print(if_has_power)
    if not if_has_power:
        return HttpResponse('用户权限过期！')
    if request.method == 'POST':
        res = getPostValues(request.POST)
        if ('id' in res.keys()) and ('sender' in res.keys()) \
                and ('receiver' in res.keys()) and ('title' in res.keys()) \
                and ('content' in res.keys()):
            try:
                # 查找id与user匹配的草稿并编辑
                conditions = {
                    'id': res['id'],
                    'sender': res['sender']
                }
                date = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
                DraftBox.objects.filter(**conditions).update(title=res['title'], receiver=res['receiver'], content=res['content'], date=date)
                return HttpResponse('Success!')
            except:
                return HttpResponse('Update error!')
        else:
            return HttpResponse('Incomplete parameters!')
    else:
        return HttpResponse('Error!')