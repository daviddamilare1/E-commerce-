from django.shortcuts import render, redirect
from django.contrib import messages

from userauths.forms import UserRegisterForm, LoginForm
from vendor.models import *
from userauths.models import Profile, User

from django.contrib.auth import authenticate, login, logout












            # SIGN UP
def sign_up(request):
    if request.user.is_authenticated:
        messages.error(request, 'You are already logged in')
        return redirect ('core:index')
    
    form = UserRegisterForm(request.POST or None)

    if form.is_valid():
        user = form.save()

        full_name = form.cleaned_data.get('full_name')   
        email = form.cleaned_data.get('email')
        phone = form.cleaned_data.get('phone')
        password = form.cleaned_data.get('password1') 
        # user_type = form.cleaned_data.get('user_type')

        # return redirect('userauths:sign-in')

        # If you want the user to be logged in aujtomatically after registering
        user = authenticate(email=email, password=password)
        login(request, user)

        messages.success(request, f'Hey,{full_name}, your account was created successfully')
        # Automatically create their profile 
        profile = Profile.objects.create(full_name=full_name, phone=phone, user=user)

        # Check the user type the user selected
        # if user_type == "Vendor":
        #     Vendor.objects.create(user=user, store_name=full_name)
        #     profile.user_type= "Vendor"

        # else:
        #     profile.user_type = "Customer"
        profile.user_type = "Customer"

        profile.save()

      
    

    context = {
        'form':form
    }

    return render (request, 'userauths/sign-up.html', context)






        # SIGN IN
def sign_in(request):
    if request.user.is_authenticated:
        messages.error(request, 'You are already logged in')
        return redirect('core:index')

    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')

            # Authenticate user
            user = authenticate(request, email=email, password=password)
            if user is not None and user.is_active:
                login(request, user)
                messages.success(request, 'You are logged in')
                next_url = request.GET.get('next', 'core:index')
                return redirect(next_url)
            else:
                # Add non-field error to the form
                form.add_error(None, 'Invalid email or password.')
        
    else:
        form = LoginForm()

    if 'next' in request.GET:
        messages.info(request, 'Log in to access the page')

    context = {
        'form': form
    }
    return render(request, 'userauths/sign-in.html', context)







        # LOGOUT VIEW
def sign_out(request):
    if 'cart_id' in request.session:
        cart_id = request.session['cart_id']
    else:
        cart_id = None
    
    logout(request)

    request.session['cart_id'] = cart_id
    messages.success(request, 'You have been logged out.')
    return redirect('userauths:sign_in')
                    



