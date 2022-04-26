from email_app.utils.send_email import sendEmail

# 测试IMAP合法性
def test_IMAP(user,IMAP):
    flag = sendEmail(user, IMAP, '1755742107@qq.com', 'IMAP合法性校验', '因迈尔邮箱管理')
    print(flag,555)
    if not flag:
        return False
    return True
