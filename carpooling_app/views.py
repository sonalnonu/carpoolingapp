from django.shortcuts import render
from django.http import HttpResponseRedirect 
from .models import*


# Create your views here.

def welcomeee(request):
	return render(request,'welcome.html')

def register(request):
	if request.method=="POST":
		name=request.POST['usrnm']
		email=request.POST['email']
		password=request.POST['psw']
		Userregistration(username=name,email=email,password=password,status='pending').save()
		return render(request,'register.html')
	else:
		return render(request,'register.html')

def login(request):
	if request.method=="POST":
		name=request.POST['usrnm']
		password=request.POST['psw']
		var=Userregistration.objects.all().filter(username=name,password=password)
		var2=adminlog.objects.all().filter(admin_name=name,admin_pas=password)
		if var:
			for x in var:
				request.session['id']=x.id
				return render(request,'userhome.html')
		elif var2:
			for x in var2:
				request.session['id']=x.id
				return render(request,'admin/adminhome.html')
		else:
			return render(request,'login.html')
	else:
		return render(request,'login.html')
def userhome(request):
	return render(request,'userhome.html')
def profile(request):
	myid=request.session['id']
	var=Userregistration.objects.all().filter(id=myid)
	return render(request,'profile.html',{'var':var})
def editprofile(request):
	myid=request.session['id']
	if request.method=="POST":
		name=request.POST['usrnm']
		email=request.POST['email']
		password=request.POST['psw']
		Userregistration.objects.all().filter(id=myid).update(username=name,email=email,password=password)
		return HttpResponseRedirect('/profile/')
	else:
		var=Userregistration.objects.all().filter(id=myid)
		return render(request,'editprofile.html',{'var':var})
def addproduct(request):
	if request.method=="POST":
		name=request.POST['name']
		price=request.POST['price']
		quantity=request.POST['quantity']
		category=request.POST['category']
		var=Productinfo(name=name,price=price,quantity=quantity,category=category).save()
		return render(request,'addproduct.html')
	else:
		return render(request,'addproduct.html')
def viewproduct(request):
	var=Productinfo.objects.all()
	return render(request,'viewproduct.html',{'var':var})
def deleteproduct(request):
	getid=request.GET['id']
	var=Productinfo.objects.all().filter(id=getid).delete()
	return HttpResponseRedirect('/viewproduct/')

def editproduct(request):
	if request.method=="POST":
	    name=request.POST['name']
	    price=request.POST['price']
	    quantity=request.POST['quantity']
	    category=request.POST['category']
	    pid=request.POST['getid']
	    Productinfo.objects.all().filter(id=pid).update(name=name,price=price,quantity=quantity,category=category)
	    return HttpResponseRedirect('/viewproduct/')
	else:
		getid=request.GET['id']
		var=Productinfo.objects.all().filter(id=getid)
		return render(request,'editproductinfo.html',{'var':var,'getid':getid})
def logout(request):
    if request.session.has_key('id'):
    	del request.session['id']
    	logout(request)
    	return HttpResponseRedirect('/login/')
def adminhome(request):
	return render(request,'adminhome.html')    	
def admin_users_list(request):
    var=Userregistration.objects.all().filter(status='pending')
    var2=Userregistration.objects.all().filter(status='approved')
    var3=Userregistration.objects.all().filter(status='rejected')
    return render(request,'admin/admin_users_list.html',{'var':var,'var2':var2,'var3':var3})
def approve(request):
	getid=request.GET['id']
	var=Userregistration.objects.all().filter(id=getid).update(status='approved')
	return HttpResponseRedirect('/admin_users_list/')
def reject(request):
	getid=request.GET['id']
	var=Userregistration.objects.all().filter(id=getid).update(status='rejected')
	return HttpResponseRedirect('/admin_users_list/')
def index(request):
	return render(request,'user/index.html')
def about(request):
	return render(request,'user/about.html')
def user_register(request):
	return render(request,'user/user_register.html')
