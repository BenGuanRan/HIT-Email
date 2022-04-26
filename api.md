## token规则
加密：账号&当前登录时间戳 ；
单次登录有效时间6h
## 发送验证码 / sendVerifyCode
**post** verifyCode\username
## 注册 / register
**post** username\password\verifyCode
## 草稿箱 / saveEmail
**post** title\date\receiver\content\sender    
## 已发送 / saveHasSend
**post** title\receiver\content\date\sender
## 发送邮件 /sendEmail
**post** title\receiver\content\date\sender\IMAP(可选)
## 登录 /login
**post** username\password
## 删除草稿箱 /deleteEmail
**post** id\user
## 获取草稿箱邮件 /**getDraftBoxEmails**
**GET** username
## 绑定自己的IMAP /saveIMAP
**POST** username\IMAP
## 收件箱 /getEmails
**GET** username
## 修改草稿箱 /editDraftbox
**POST** title\date\receiver\content\sender\id