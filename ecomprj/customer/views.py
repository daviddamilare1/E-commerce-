from django.shortcuts import redirect, render, reverse
from django.http import JsonResponse

from django.contrib import messages
from django.db import models
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import check_password
from django.views.decorators.csrf import csrf_protect
# from django.utils.http import is_safe_url
from django.utils.http import url_has_allowed_host_and_scheme as is_safe_url
from django.contrib.auth.hashers import check_password
from django.contrib.auth import update_session_auth_hash

from plugin.paginate_queryset import paginate_queryset
from core.models import *
from customer.models import *
from userauths.models import Profile










        # DASHBOARD
@login_required(login_url='userauths:sign_in')
def c_dashboard(request):
    orders_list = Order.objects.filter(customer=request.user, payment_status='Paid')
    orders = paginate_queryset(request, orders_list,1) #Pagination
    total_spent = Order.objects.filter(customer=request.user, payment_status='Paid').aggregate(total=models.Sum('total'))['total'] or 0
    noti = Notifications.objects.filter(user=request.user, seen=False).count()

    context = {
        'orders': orders,
        'orders_list':orders_list,
        'total_spent': total_spent,
        'noti':noti

    }

    return render(request, 'customer/dashboard.html', context)




        # ORDERS
@login_required(login_url='userauths:sign_in')
def order_list(request):
    orders_list = Order.objects.filter(customer=request.user)
    orders = paginate_queryset(request, orders_list,1)
    

    context = {
        'orders':orders,
        'orders_list':orders_list
        
    }

    return render(request, 'customer/order_list.html', context)



        # ODER DETAILS
@login_required(login_url='userauths:sign_in')
def order_details(request, oid):
    order = Order.objects.get(customer=request.user, oid=oid)
    # address = Address.objects.get(user=request.user)


    context = {
        'order':order,
        # 'address': address,
    }

    return render(request, 'customer/order_details.html', context)




        # ORDER ITEM DETAIL
@login_required(login_url='userauths:sign_in')
def order_item_detail(request, oid, item_id):
    order = Order.objects.get(customer=request.user, oid=oid)
    item = OrderItem.objects.get(order=order, item_id=item_id)
    
    context = {
        "order": order,
        "item": item,
    }

    return render(request, "customer/order_item_detail.html", context)




        # WISHLIST
@login_required(login_url='userauths:sign_in')
def wishlist(request):
    if request.user.is_authenticated:
        wishlist_list = Wishlist.objects.filter(user=request.user)
        wishlist = paginate_queryset(request, wishlist_list, 1)
    else:
        messages.error(request, 'Log in to see Wishlist')
        return redirect('userauths:sign_in')


    context = {
        'wishlist_list': wishlist_list,
        'wishlist': wishlist,
    }

    return render(request, "customer/wishlist.html", context)


        
        # Remove Item from Wishlist
@login_required(login_url='userauths:sign_in')
def remove_wishlist(request, id):
    wishlist = Wishlist.objects.get(user=request.user, id=id)
    wishlist.delete()

    messages.success(request, 'Item removed from wishlist')

    return redirect('customer:wishlist')





        # ADD TO WISHLIST
@login_required(login_url='userauths:sign_in')
@csrf_protect
def add_to_wishlist(request, id):
    if request.method == 'POST':
        if request.user.is_authenticated:
            product = Product.objects.filter(id=id).first()
            if not product:
                return JsonResponse({'message': 'Product not found', 'in_wishlist': False}, status=404)

            action = request.POST.get('action', 'add')
            wishlist_item = Wishlist.objects.filter(user=request.user, product=product).first()

            if action == 'add' and not wishlist_item:
                Wishlist.objects.create(user=request.user, product=product)
                wishlist_item = Wishlist.objects.filter(user=request.user, product=product).first()
            elif action == 'remove' and wishlist_item:
                wishlist_item.delete()

            wishlist = Wishlist.objects.filter(user=request.user)
            return JsonResponse({
                'message': 'Item added to Wishlist' if action == 'add' and wishlist_item else 'Item removed from Wishlist',
                'wishlist_count': wishlist.count(),
                'in_wishlist': Wishlist.objects.filter(user=request.user, product=product).exists()
            })
        else:
            return JsonResponse({'message': 'Login to add to Wishlist', 'wishlist_count': 0, 'in_wishlist': False})
    return JsonResponse({'message': 'Invalid request method', 'in_wishlist': False}, status=400)





@login_required(login_url='userauths:sign_in')
def notifications(request):
    notis = Notifications.objects.filter(user=request.user, seen=False).order_by('-date')

    context = {
        'notis':notis,
    }


    return render(request, 'customer/notifications.html', context)



        # Mark notification as seen
@login_required(login_url='userauths:sign_in')
def mark_noti_seen(request, id):
    noti = Notifications.objects.get(id=id, user=request.user)
    noti.seen = True
    noti.save()
    messages.success(request, 'Marked as seen')
    return redirect('customer:notifications')





            # CREATE ADDRESS
@login_required(login_url='userauths:sign_in')
def create_address(request):
    if request.method == 'POST':
        full_name = request.POST.get('full_name')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        address = request.POST.get('address')
        city = request.POST.get('city')
        state = request.POST.get('state')
        country = request.POST.get('country')
        zip_code = request.POST.get('zip_code')


        Address.objects.create(
            user=request.user,
            full_name=full_name,
            email=email,
            mobile=mobile,
            address=address,
            city=city,
            state=state,
            country=country,
            zip_code=zip_code,

        )


        messages.success(request, 'Address Created')
        previous_url = request.session.get('previous_url', 'customer:addresses')
        return redirect(previous_url)

    # Store the current referer in session for use after POST
    request.session['previous_url'] = request.META.get('HTTP_REFERER', 'customer:addresses')

    
    return render(request, 'customer/create_address.html')




            # ADDRESS
@login_required(login_url='userauths:sign_in')
def address(request):
    addresses = Address.objects.filter(user=request.user)

    context = {
        'addresses': addresses,
    }

    return render(request, 'customer/addresses.html', context)



        # ADDRESS DETAILs

@login_required(login_url='userauths:sign_in')
def address_details(request, id):
    address = Address.objects.get(user=request.user, id=id)
    # order =Order.objects.get(oid=oid)
    # previous_url = 


    if request.method == 'POST':
        full_name = request.POST.get('full_name')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        address_location = request.POST.get('address_location')
        city = request.POST.get('city')
        state = request.POST.get('state')
        country = request.POST.get('country')
        zip_code = request.POST.get('zip_code')

        address.full_name = full_name
        address.email = email
        address.mobile = mobile
        address.address = address_location
        address.city = city
        address.state = state
        address.country = country
        address.zip_code = zip_code
        address.save()

        messages.success(request, 'Address Updated')
        previous_url = request.session.get('previous_url', 'customer:addresses')
        return redirect(previous_url)

    # Store the current referer in session for use after POST
    request.session['previous_url'] = request.META.get('HTTP_REFERER', 'customer:addresses')
        # return redirect ('customer:addresses')
        

 
    context = {
        'address': address,
        
    }

    return render(request, 'customer/address_details.html', context)




            # DELETE ADDRESS
@login_required(login_url='userauths:sign_in')
def delete_address(request, id):
    address = Address.objects.get(user=request.user, id=id)
    
    if address:
        address = Address.objects.get(user=request.user, id=id)
        address.delete()
        messages.success(request, 'You deleted an address')
        return redirect ('customer:addresses')





        # VIEW AND UPDATE PROFILE
@login_required(login_url='userauths:sign_in')
def profile(request):
    
    
    
    profile = Profile.objects.get(user=request.user)

    if request.method == 'POST':
        full_name = request.POST.get('full_name')
        image = request.FILES.get('image')
        phone = request.POST.get('phone')
        user_type = request.POST.get('user_type')


        

        profile.full_name = full_name
        if image:
            profile.image = image
        
        profile.phone = phone
        profile.user_type = user_type
        profile.save()

        messages.success(request, 'Profile Updated')
        return redirect('customer:profile')
    
    context = {
        'profile': profile,
        
    }

    return render(request, 'customer/profile.html', context)

        






        # CHANGE PASSWORD
@login_required(login_url='userauths:sign_in')
def change_password(request):
    user = request.user
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        confirm_new_password = request.POST.get('confirm_new_password')

        # If all inputs aren't filled in properly
        if not all([old_password, new_password, confirm_new_password]):
            messages.warning(request, 'All fields are required')
            return redirect('customer:change_password')
        
            # if these two don't match
        if confirm_new_password != new_password:
            messages.error(request, 'Confirm New Password and New Password must be the same.')
            return redirect('customer:change_password')

            # If old password is incorrect
        if not check_password(old_password, user.password):
            messages.error(request, 'Current Password is incorrect.')
            return redirect('customer:change_password')
        
            # set the new password
        try:
            user.set_password(new_password)
            user.save()
            # update_session_auth_hash(request, user) #keep the user logged in 
            messages.success(request, 'Password updated successfully.')
            return redirect('customer:dashboard')
        except Exception as e:
            messages.success(request, f'Error Updating Password: {str(e)}')
            return redirect('customer:change_password')


    return render(request, 'customer/change_password.html')
    





    











