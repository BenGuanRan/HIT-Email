# Generated by Django 4.0.3 on 2022-04-28 12:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('email_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='user_count',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('count', models.IntegerField(max_length=32)),
            ],
        ),
    ]
