# 邮件测试
import smtplib
from email.header import Header # 用来编辑邮件头部信息
from email.mime.text import MIMEText # 用来发送文本邮件
from email.mime.image import MIMEImage # 图片作为附件的邮件
from email.mime.multipart import MIMEMultipart # 多种邮件

# 发送方的邮件
sender_mail = '1755742107@qq.com'
sender_pass = 'wjocdjymmnakcdbi'
# 接收方账号
receiver_mail = '1755742107@qq.com'
sftp_obj =smtplib.SMTP('smtp.qq.com', 25)
sftp_obj.login(sender_mail, sender_pass)

# 邮件内容
text_info = 'hello'
text_sub = MIMEText(text_info,'plain', 'utf-8')

# 根据邮件内容构造邮件体
msg_root = MIMEMultipart('mixed') # 混合类邮件体
# 邮件添加的头尾信息等
msg_root['From'] = '1755742107@qq.com<1755742107@qq.com>'
msg_root['To'] = receiver_mail
# 邮件的主题，显示在接收邮件的预览页面
subject = 'python sendemail test successful'
msg_root['subject'] = Header(subject, 'utf-8')
# 将邮件内容加入邮件体
msg_root.attach(text_sub)

# 尝试发送邮件
sftp_obj.sendmail(sender_mail, receiver_mail, msg_root.as_string())
sftp_obj.quit()
print('sendemail successful!')