# 发送邮件
import time
import smtplib
from email.header import Header # 用来编辑邮件头部信息
from email.mime.multipart import MIMEMultipart # 混合邮件
from email.mime.text import MIMEText # 用来发送文本邮件

# sender_username = '356175531@qq.com'
# sender_password = 'dzcrctbkwcvabidd'
# receiver = '1755742107@qq.com'

def sendEmail(sender_username,sender_password,receiver,message,title):
    """
    发送邮件
    """
    email_body = MIMEMultipart('mixed') # 混合类邮件体
    # 邮件添加的头尾信息等
    email_body['From'] = sender_username+'<'+sender_username+'>'
    email_body['To'] = receiver
    # 邮件的主题，显示在接收邮件的预览页面
    subject = title
    email_body['subject'] = Header(subject, 'utf-8')
    mes_info = MIMEText(message, 'plain', 'utf-8')
    # 将邮件内容加入邮件体
    email_body.attach(mes_info)
    # 尝试发送邮件
    try:
        # 登录
        sftp = smtplib.SMTP('smtp.qq.com', 25)
        sftp.login(sender_username, sender_password)
        # 发送
        sftp.sendmail(sender_username, receiver, email_body.as_string())
        sftp.quit()
        print('邮件发送成功！')
        return True

    except Exception as e:
        print('发送邮件失败')
        print(e)
        return False