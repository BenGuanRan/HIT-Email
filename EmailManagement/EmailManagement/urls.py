from django.contrib import admin
from django.urls import path
from email_app import views
from django.views.generic.base import TemplateView
 
urlpatterns = [
    path('api/hello', views.hello),
    path('api/home',views.home),
    path('api/login', views.login),
    path('api/sendVerifyCode', views.sendVerifyCode),
    path('api/register', views.register),
    path('api/saveEmail', views.saveEmail),
    path('api/saveHasSend', views.saveHasSend),
    path('api/sendEmail', views.postEmail),
    path('api/deleteEmail', views.deleteEmail),
    path('api/getDraftBoxEmails', views.getDraftBoxEmails),
    path('api/saveIMAP', views.saveIMAP),
    path('api/getEmails', views.getEmails),
    path('api/getOutbox', views.getOutbox),
    path('api/editDraftbox', views.editDraftbox),
    path('', TemplateView.as_view(template_name='index.html')),
]
