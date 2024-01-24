from django.db import models

# Create your models here.

class Userregistration(models.Model):
	username=models.CharField(max_length=250,default='')
	email=models.CharField(max_length=250,default='')
	password=models.CharField(max_length=250,default='')
	usertype=models.CharField(max_length=250,default='')
	status=models.CharField(max_length=250,default='')

class Productinfo(models.Model):
    name=models.CharField(max_length=250,default='')
    price=models.CharField(max_length=250,default='')
    quantity=models.CharField(max_length=250,default='')
    category=models.CharField(max_length=250,default='')		

class adminlog(models.Model):
	admin_name=models.CharField(max_length=250,default='')
	admin_pas=models.CharField(max_length=250,default='')	

