# Generated by Django 4.0.3 on 2022-04-11 02:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('email_app', '0002_draftbox'),
    ]

    operations = [
        migrations.CreateModel(
            name='hasSend',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=32)),
                ('date', models.CharField(max_length=32)),
                ('sender', models.CharField(max_length=32)),
                ('receiver', models.CharField(max_length=32)),
                ('content', models.CharField(max_length=256)),
            ],
        ),
        migrations.AddField(
            model_name='draftbox',
            name='date',
            field=models.CharField(default=-7, max_length=32),
            preserve_default=False,
        ),
    ]