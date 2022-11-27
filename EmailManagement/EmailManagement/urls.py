from django.contrib import admin
from django.urls import path
from email_app import views
from django.views.generic.base import TemplateView
 
urlpatterns = [
    path('hello', views.hello),
    path('home',views.home),
    path('login', views.login),
    path('sendVerifyCode', views.sendVerifyCode),
    path('register', views.register),
    path('saveEmail', views.saveEmail),
    path('saveHasSend', views.saveHasSend),
    path('sendEmail', views.postEmail),
    path('deleteEmail', views.deleteEmail),
    path('getDraftBoxEmails', views.getDraftBoxEmails),
    path('saveIMAP', views.saveIMAP),
    path('getEmails', views.getEmails),
    path('getOutbox', views.getOutbox),
    path('editDraftbox', views.editDraftbox),
    path('', TemplateView.as_view(template_name='index.html')),
]
