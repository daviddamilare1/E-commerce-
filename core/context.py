from core.models import *
from customer.models import Wishlist






def default(request):
    try:
        cart_id = request.session['cart_id']
        total_cart_items = Cart.objects.filter(cart_id=cart_id).count()
        
    except:
        total_cart_items = 0



    if request.user.is_authenticated:
        wishlist_count = Wishlist.objects.filter(user=request.user).count()
        wishlist_list = Wishlist.objects.filter(user=request.user)
        order = Order.objects.filter(customer=request.user, payment_status='Processing').first() #Get the checkout order
    else:
        wishlist_count = 0
        wishlist_list = None
        order = None
    


    return {
        'total_cart_items':total_cart_items,
        'wishlist_count': wishlist_count,
        'order': order,
        'wishlist_list': wishlist_list,
    }
