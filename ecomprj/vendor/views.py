from django.shortcuts import render, redirect
from django.contrib import messages

from django.contrib.auth.decorators import login_required
from vendor.decorators import admin_required
from plugin.paginate_queryset import paginate_queryset


from django.contrib.auth.hashers import check_password
from django.contrib.auth import update_session_auth_hash

from core.models import *
from vendor.models import *
from django.db import models
from userauths.models import Profile

from django.db.models.functions import TruncMonth, TruncYear
from django.db.models import Count
import json





        # FUUNCTION TO GET MONTHLY SALES
def get_monthly_sales():
    monthly_sales = (
        OrderItem.objects.annotate(month=TruncMonth('date'))
        .values('month')
        .annotate(order_count = models.Count('id'))
        .order_by('month')
    )

    return monthly_sales


        # FUUNCTION TO GET YEARLY SALES
def get_yearly_sales():
    yearly_sales = (
        OrderItem.objects
        .annotate(year=TruncYear('date'))
        .values('year')
        .annotate(order_count=Count('id'))
        .order_by('year')
    )
    return yearly_sales







            # DASHBOARD
@login_required(login_url='userauths:sign_in')
@admin_required
def dashboard(request):
    products = Product.objects.filter(vendor=request.user)
    orders = Order.objects.filter(vendors=request.user, payment_status='Paid')
    revenue = OrderItem.objects.filter(vendor=request.user).aggregate(total = models.Sum('total'))['total'] or 0
    notis = Notifications.objects.filter(user=request.user, seen=False)
    reviews = Review.objects.filter(product__vendor=request.user)
    rating = Review.objects.filter(product__vendor=request.user).aggregate(avg = models.Avg('rating'))['avg']
    monthly_sales = get_monthly_sales()
    yearly_sales = get_yearly_sales()

    labels = [sale['month'].strftime('%B %Y') for sale in monthly_sales]  # Format the month
    data = [sale['order_count'] for sale in monthly_sales]



    context = {
        'products': products,
        'orders': orders,
        'revenue': revenue,
        'notis': notis,
        'reviews': reviews,
        'rating': rating,
        "labels": json.dumps(labels),
        "data": json.dumps(data),
    }

    return render(request, 'vendor/dashboard.html', context)








        # PRODUCTS
@login_required(login_url='userauths:sign_in')
@admin_required
def products(request):
    # products = Product.objects.filter(vendor=request.user)
    products_list = Product.objects.filter(vendor=request.user)
    products = paginate_queryset(request, products_list,10) #Pagination



    context = {
        'products': products,
        'products_list': products_list,
        
    }

    return render(request, 'vendor/products.html', context)









            # ORDERS
@login_required(login_url='userauths:sign_in')
@admin_required
def orders(request):
    orders = Order.objects.filter(vendors=request.user, payment_status = 'Paid')
    

    context = {
    'orders': orders,
    
    
    }

    return render(request, 'vendor/orders.html', context)




            # ORDER DETAILS
@login_required(login_url='userauths:sign_in')
@admin_required
def order_details(request,oid):
    order = Order.objects.get(vendors=request.user, payment_status = 'Paid', oid=oid)
    

    context = {
    'order': order,
    
    
    }

    return render(request, 'vendor/order_details.html', context)




            # ORDER ITEM DETAIL
@login_required(login_url='userauths:sign_in')
@admin_required
def order_item_detail(request,oid, item_id):
    order = Order.objects.get(vendors=request.user, payment_status = 'Paid', oid=oid)
    item = OrderItem.objects.get(item_id=item_id, order=order)

    context = {
    'order': order,
    'item': item,
    
    
    }

    return render(request, 'vendor/order_item_detail.html', context)





            # UPDATE ORDER STATUS
@login_required(login_url='userauths:sign_in')
@admin_required
def update_order_status(request, oid):
    order = Order.objects.get(vendors=request.user, payment_status = 'Paid', oid=oid)


    if request.method == 'POST':
        order_status = request.POST.get('order_status')
        order.order_status = order_status
        order.save()


        messages.success(request, 'Order Status Updated')
        return redirect('vendor:order_details', order.oid)
    
    return redirect('vendor:order_details', order.oid)




            # UPDATE ORDER ITEM STATUS
@login_required(login_url='userauths:sign_in')
@admin_required
def update_order_item_status(request, oid, item_id):
    order = Order.objects.get(vendors=request.user, payment_status = 'Paid', oid=oid)
    item = OrderItem.objects.get(item_id=item_id, order=order)


    if request.method == 'POST':
        order_status = request.POST.get('order_status')
        shipping_service = request.POST.get('shipping_service')
        tracking_id = request.POST.get('tracking_id')

        item.order_status = order_status
        item.shipping_service = shipping_service
        item.tracking_id = tracking_id
        item.save()


        messages.success(request, 'Item Status Updated')
        return redirect('vendor:order_item_detail', order.oid, item.item_id)
    
    return redirect('vendor:order_item_detail', order.oid, item.item_id)







            # LIST COUPONS
@login_required(login_url='userauths:sign_in')
@admin_required
def coupons(request):
    coupons = Coupon.objects.filter(vendor=request.user).order_by('-id')

    context = {
        'coupons': coupons,
    }


    return render(request, 'vendor/coupons.html', context)




        # CREATE COUPON
@login_required(login_url='userauths:sign_in')
@admin_required
def create_coupon(request):
    if request.method == 'POST':
        code = request.POST.get('coupon_code')
        discount = request.POST.get('coupon_discount')

        Coupon.objects.create(
            vendor=request.user,
            code=code,
            discount=discount,
            active=True

        )

    messages.success(request, "Coupon created")
    return redirect("vendor:coupons")

    # return render(request, 'vendor/create_coupon.html')





        # UPDATE COUPON
@login_required(login_url='userauths:sign_in')
@admin_required
def update_coupon(request, id):
    coupon = Coupon.objects.get(vendor=request.user, id=id)

    if request.method == 'POST':
        code = request.POST.get('coupon_code')
        discount = request.POST.get('coupon_discount')

        coupon.code = code
        coupon.discount = discount
        coupon.save()

    messages.success(request, "Coupon updated")
    return redirect("vendor:coupons")




        # DELETE COUPON
@login_required(login_url='userauths:sign_in')
@admin_required
def delete_coupon(request, id):
    coupon = Coupon.objects.get(vendor=request.user, id=id)
    coupon.delete()

    messages.error(request, "Coupon deleted")
    return redirect("vendor:coupons")




 

        # REVIEWS
@login_required(login_url='userauths:sign_in')
@admin_required
def reviews(request):
    reviews = Review.objects.filter(product__vendor=request.user)

        # Filter function
    rating = request.GET.get('rating')
    date = request.GET.get('date')

    if rating:
        reviews = reviews.filter(rating=rating)

    if date:
        reviews = reviews.order_by(date)
    

    context = {
        'reviews': reviews,
    }

    return render(request, 'vendor/reviews.html', context)





        # REPLY REVIEW
@login_required(login_url='userauths:sign_in')
@admin_required
def reply(request, id):
    review = Review.objects.get(id=id)

    if request.method == 'POST':
        reply = request.POST.get('reply')

        review.reply = reply
        review.save()


    messages.success(request, "You replied a review")
    return redirect("vendor:reviews")

    


        # NOTIFICATIONS
@login_required(login_url='userauths:sign_in')
@admin_required
def notifications(request):
    notis = Notifications.objects.filter(user=request.user, seen=False).order_by('-date')


    context = {
        'notis': notis,
    }

    return render(request, 'vendor/notifications.html', context)






        # MARK NOTIFICATION AS SEEN
@login_required(login_url='userauths:sign_in')
@admin_required
def mark_noti_seen(request, id):
    noti = Notifications.objects.get(id=id, user=request.user)
    noti.seen = True
    noti.save()
    messages.success(request, 'Marked as seen')
    return redirect('vendor:notifications')





        #  VIEW AND UPDATE PROFILE
@login_required(login_url='userauths:sign_in')
def profile(request):
    profile = Profile.objects.get(user=request.user)

    if request.method == 'POST':
        full_name = request.POST.get('full_name')
        image = request.FILES.get('image')
        phone = request.POST.get('phone')
        


        profile.full_name = full_name
        if image:
            profile.image = image
        
        profile.phone = phone
        profile.save()

        messages.success(request, 'Profile Updated')
        return redirect('vendor:profile')
    
    context = {
        'profile': profile,
        
    }

    return render(request, 'vendor/profile.html', context)









       # CHANGE PASSWORD
@login_required(login_url='userauths:sign_in')
@admin_required
def change_password(request):
    user = request.user
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        confirm_new_password = request.POST.get('confirm_new_password')

        # If all inputs aren't filled in properly
        if not all([old_password, new_password, confirm_new_password]):
            messages.warning(request, 'All fields are required')
            return redirect('vendor:change_password')
        
            # if these two don't match
        if confirm_new_password != new_password:
            messages.error(request, 'Confirm New Password and New Password must be the same.')
            return redirect('vendor:change_password')

            # If old password is incorrect
        if not check_password(old_password, user.password):
            messages.error(request, 'Current Password is incorrect.')
            return redirect('vendor:change_password')
        
            # set the new password
        try:
            user.set_password(new_password)
            user.save()
            update_session_auth_hash(request, user) #keep the user logged in 
            messages.success(request, 'Password updated successfully.')
            return redirect('vendor:dashboard')
        except Exception as e:
            messages.success(request, f'Error Updating Password: {str(e)}')
            return redirect('vendor:change_password')


    return render(request, 'vendor/change_password.html')
    







        # CREATE PRODUCT
@login_required(login_url='userauths:sign_in')
@admin_required
def create_product(request):
    categories = Category.objects.all()


    if request.method == "POST":
        image = request.FILES.get('image')
        name = request.POST.get('name')
        category_id = request.POST.get('category_id')
        desc = request.POST.get('desc')
        price = request.POST.get('price')
        regular_price = request.POST.get('regular_price')
        stock = request.POST.get('stock')
        shipping = request.POST.get('shipping')
        featured = request.POST.get('featured') == 'on'
        

        category = Category.objects.get(id=category_id)
        product = Product.objects.create(
            vendor=request.user,
            image=image,
            name=name,
            category=category,
            desc=desc,
            price=price,
            regular_price=regular_price,
            shipping=shipping,
            stock=stock,
            featured=featured,

        )

        messages.success(request, 'Product Added')
        return redirect('vendor:products')




    context = {
    'categories': categories,

    }


    return render(request, "vendor/create_product.html", context)



