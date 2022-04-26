from django.db import models

# 存放用户信息
class Users(models.Model):
    username = models.CharField(max_length=32)
    password = models.CharField(max_length=64)
    IMAP = models.CharField(max_length=32)

# 暂存邮件(草稿箱)
class DraftBox(models.Model):
    title = models.CharField(max_length=32)
    date = models.CharField(max_length=32)
    receiver = models.CharField(max_length=32)
    content = models.CharField(max_length=2560)
    sender = models.CharField(max_length=32)

# 已发送
class HasSend(models.Model):
    title = models.CharField(max_length=32)
    date = models.CharField(max_length=32)
    sender = models.CharField(max_length=32)
    receiver = models.CharField(max_length=32)
    content = models.CharField(max_length=2560)

# 账号验证码
class username_verifyCode(models.Model):
    username = models.CharField(max_length=32)
    verifyCode = models.CharField(max_length=8)


# 存放用户token
class Token(models.Model):
    username = models.CharField(max_length=32) # 用户名
    loginTime = models.CharField(max_length=32) # 登录时间戳
    token = models.CharField(max_length=256) # token

"""
等同于sql語句：
create table email_app_users(
    id bigint auto_increment primary key,
    username varcahr(32),
    password varchar(64)
);
"""