from django.contrib import admin
from django.urls import path
from .import views

urlpatterns = [
    
    path('',views.welcomeee),
    path('register/',views.register),
    path('login/',views.login),
    path('userhome/',views.userhome),
    path('profile/',views.profile),
    path('editprofile/',views.editprofile),
    path('addproduct/',views.addproduct),
    path('viewproduct/',views.viewproduct),
    path('delete/',views.deleteproduct),
    path('editproduct/',views.editproduct),
    path('logout/',views.logout),
    path('adminhome/',views.adminhome),
    path('admin_users_list/',views.admin_users_list),
    path('approve/',views.approve),
    path('reject/',views.reject),
    path('index/',views.index),
    path('about/',views.about),
    path('user_register/',views.user_register),

]