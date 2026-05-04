from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, JsonResponse
from . models import *
from decimal import Decimal, InvalidOperation
from django.db.models import Q,Avg, Sum
from customer.models import *
from django.contrib import messages
from plugin.tax_calculation import tax_calc
from plugin.service_fee import calc_service_fee
from plugin.exchange_rate import *
from django.db.models import DecimalField
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from django.urls import reverse
from django.views.decorators.cache import never_cache
import requests
import stripe
from plugin.paginate_queryset import paginate_queryset
from django.core.mail import EmailMultiAlternatives
from mailersend.emails import NewEmail
from django.template.loader import render_to_string
from customer import models as customer_models
from vendor import models as vendor_models
from django.core.mail import send_mail
from django.db import transaction
from django.views.decorators.http import require_POST
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator









############################################################################################################ 
    # Clear cart after payments
def clear_cart_items(request):
    cart_id = request.session.get('cart_id')
    if cart_id:
        if request.user.is_authenticated:
            Cart.objects.filter(cart_id=cart_id, user=request.user).delete()
        else:
            Cart.objects.filter(cart_id=cart_id).delete()
        request.session.pop('cart_id', None)
    return JsonResponse({'message': 'Cart cleared successfully'})



@never_cache
def get_cart_items(request):
    cart_id = request.session.get('cart_id')
    if not cart_id:
        return JsonResponse({'cart_items': []})

    if request.user.is_authenticated:
        cart_items = Cart.objects.filter(cart_id=cart_id, user=request.user).values('product__id')
    else:
        cart_items = Cart.objects.filter(cart_id=cart_id).values('product__id')

    product_ids = [str(item['product__id']) for item in cart_items]
    return JsonResponse({'cart_items': product_ids})


@login_required(login_url='userauths:sign_in')
def cancel_order(request):
    order = Order.objects.filter(customer=request.user, payment_status='Processing').first()
    
    if request.user.is_authenticated:
        if order:
            order.delete()
    return redirect('core:index')
        



################################################################################################################ 


        # Home Page
from django.views.decorators.csrf import ensure_csrf_cookie

@ensure_csrf_cookie
def index(request):
    category = Category.objects.all()
    products = Product.objects.filter(status='Published', featured=True)
    

    if request.user.is_authenticated:
        # Get all product IDs in the user's wishlist
        wishlist_product_ids = Wishlist.objects.filter(user=request.user).values_list('product_id', flat=True)
    else:
        wishlist_product_ids = []


    if 'next' in request.GET:
        messages.info(request, 'Authorized accounts only.')
    

    
    
    context = {
        'products': products,
        
        'wishlist_product_ids': wishlist_product_ids,
        'category': category,
    }
    return render(request, 'core/index.html', context)


            # SHOP PAGE
def shop(request):
    products_list = Product.objects.filter(status="Published")
    categories = Category.objects.all()
    colors = VariantItem.objects.filter(variant__name='Color').values('title', 'content').distinct()
    sizes = VariantItem.objects.filter(variant__name='Size').values('title', 'content').distinct()
    item_display = [
        {"id": "1", "value": 1},
        {"id": "2", "value": 2},
        {"id": "3", "value": 3},
        {"id": "40", "value": 40},
        {"id": "50", "value": 50},
        {"id": "100", "value": 100},
    ]

    ratings = [
        {"id": "1", "value": "★☆☆☆☆"},
        {"id": "2", "value": "★★☆☆☆"},
        {"id": "3", "value": "★★★☆☆"},
        {"id": "4", "value": "★★★★☆"},
        {"id": "5", "value": "★★★★★"},
    ]

    prices = [
        {"id": "lowest", "value": "Highest to Lowest"},
        {"id": "highest", "value": "Lowest to Highest"},
    ]


    print(sizes)

    if request.user.is_authenticated:
        # Get all product IDs in the user's wishlist
        wishlist_product_ids = Wishlist.objects.filter(user=request.user).values_list('product_id', flat=True)
    else:
        wishlist_product_ids = []
    products = paginate_queryset(request, products_list, 15)

    context = {
        "products": products,
        "products_list": products_list,
        "categories": categories,
        'colors': colors,
        'sizes': sizes,
        'item_display': item_display,
        'ratings': ratings,
        'prices': prices,
        'wishlist_product_ids': wishlist_product_ids,
    }
    return render(request, 'core/shop.html', context)








            # FILTER PRODUCTS
def filter_products(request):
    # products = Product.objects.all()
    products = Product.objects.filter(status="Published")
    

    # Get filters from the AJAX request
    categories = request.GET.getlist('categories[]')
    rating = request.GET.getlist('rating[]')
    sizes = request.GET.getlist('sizes[]')
    colors = request.GET.getlist('colors[]')
    price_order = request.GET.get('prices')
    search_filter = request.GET.get('searchFilter')
    display = request.GET.get('display')

    page = request.GET.get('page', 1) 
    

   
    # Apply category filtering
    if categories:
        categories = [int(x) for x in categories if x.isdigit()]
        products = products.filter(category__id__in=categories)

    # if categories:
    #     products = products.filter(category__id__in=categories)

    # Apply rating filtering
    if rating:
        rating = [int(r) for r in rating]

        products = products.annotate(
            avg_rating=Avg('reviews__rating')
        )

        query = Q()

        for r in rating:
            query |= Q(avg_rating__gte=r, avg_rating__lt=r + 1)

        products = products.filter(query)

    

    # Apply colors filtering
    if colors:
        colors = [c for c in colors if c]
        products = products.filter(
            variants__variant_items__title__in=colors
        ).distinct()

    # Apply sizes filtering
    if sizes:
        sizes = [s for s in sizes if s]
        products = products.filter(
            variants__variant_items__content__in=sizes
        ).distinct()

    # Apply price ordering
    if price_order == 'lowest':
        products = products.order_by('-price')
    elif price_order == 'highest':
        products = products.order_by('price')

        


    # Apply search filter
    if search_filter:
        products = products.filter(name__icontains=search_filter)



    if display and display.isdigit():
        products = products[:int(display)]

    # Pagination
    paginator = Paginator(products, 15)
    page_obj = paginator.get_page(page)

    if request.user.is_authenticated:
        # Get all product IDs in the user's wishlist
        wishlist_product_ids = Wishlist.objects.filter(user=request.user).values_list('product_id', flat=True)
    else:
        wishlist_product_ids = []


    # Render the filtered products as HTML 
    html = render_to_string('partials/_store.html', {'products': page_obj, 'wishlist_product_ids': wishlist_product_ids})

    return JsonResponse({'html': html, 'product_count': products.count(), 'num_pages': paginator.num_pages})









        # Category details
def category_detail(request, slug):
    category = Category.objects.get(slug=slug)
    products_list = products = Product.objects.filter(status='Published', category=category)

    categories = Category.objects.all()
    colors = VariantItem.objects.filter(variant__name='Color').values('title', 'content').distinct()
    sizes = VariantItem.objects.filter(variant__name='Size').values('title', 'content').distinct()
    item_display = [
        {"id": "1", "value": 1},
        {"id": "2", "value": 2},
        {"id": "3", "value": 3},
        {"id": "40", "value": 40},
        {"id": "50", "value": 50},
        {"id": "100", "value": 100},
    ]

    ratings = [
        {"id": "1", "value": "★☆☆☆☆"},
        {"id": "2", "value": "★★☆☆☆"},
        {"id": "3", "value": "★★★☆☆"},
        {"id": "4", "value": "★★★★☆"},
        {"id": "5", "value": "★★★★★"},
    ]

    prices = [
        {"id": "lowest", "value": "Highest to Lowest"},
        {"id": "highest", "value": "Lowest to Highest"},
    ]

    products = paginate_queryset(request, products_list, 15)
    

    if request.user.is_authenticated:
        # Get all product IDs in the user's wishlist
        wishlist_product_ids = Wishlist.objects.filter(user=request.user).values_list('product_id', flat=True)
    else:
        wishlist_product_ids = []
    

    context = {
        'products': products,
        'category': category,
        'wishlist_product_ids': wishlist_product_ids,
        "categories": categories,
        'colors': colors,
        'sizes': sizes,
        'item_display': item_display,
        'ratings': ratings,
        'prices': prices,
    }
    return render(request, 'core/category_detail.html', context)








        # Product Detail Page
def product_details(request, slug):
    product = Product.objects.get(status='Published', slug=slug)
    related_products = Product.objects.filter(category=product.category, status='Published').exclude(id=product.id)
    # p_images = Gallery.objects.filter(product=product)
    review_count = Review.objects.filter(product=product).count()
    product_stock_range = range(1, product.stock + 1) # 1,2,3


    if request.user.is_authenticated:
        # Get all product IDs in the user's wishlist
        wishlist_product_ids = Wishlist.objects.filter(user=request.user).values_list('product_id', flat=True)
    else:
        wishlist_product_ids = []

    context = {
        'product':product,
        # 'p_images': p_images,
        'review_count': review_count,
        'related_products': related_products,
        'product_stock_range': product_stock_range,
        'wishlist_product_ids': wishlist_product_ids,
    }
    return render(request, 'core/product_details.html', context)


####################################################################################################


############################# Cart, Order and Checkout ########################################################################### 

        # Add To Cart function
@never_cache
def add_to_cart(request):
    id = request.GET.get('id')
    qty = request.GET.get('qty')
    color = request.GET.get('color')
    size = request.GET.get('size')
    cart_id = request.GET.get('cart_id')
    

    request.session['cart_id'] = cart_id

    if not id or not qty or not cart_id:
        return JsonResponse({'error': ' No id, qty or cart_id'}, status=400)
    

    try:
        product = Product.objects.get(status='Published', id=id)

    except Product.DoesNotExist:
        return JsonResponse({'error': 'Product not found'}, status=404)
    
    existing_cart_items = Cart.objects.filter(cart_id=cart_id, product=product).first()
    if int(qty) > product.stock:
        return JsonResponse({'error': 'Qty exceed current stock amount'}, status=404)
    
    if not existing_cart_items:
        cart = Cart()
        cart.product = product
        cart.qty = qty
        cart.price = product.price
        cart.color = color
        cart.size = size
        cart.sub_total = Decimal(product.price) * Decimal(qty)
        cart.shipping = Decimal(product.shipping) * Decimal(qty)
        cart.total = cart.sub_total + cart.shipping 
        cart.user = request.user if request.user.is_authenticated else None
        cart.cart_id = cart_id
        cart.save()


        message = 'Item added to cart'

    else:
        existing_cart_items.product = product
        existing_cart_items.qty = qty
        existing_cart_items.price = product.price
        existing_cart_items.color = color or existing_cart_items.color
        existing_cart_items.size = size or existing_cart_items.size
        existing_cart_items.sub_total = Decimal(product.price) * Decimal(qty)
        existing_cart_items.shipping = Decimal(product.shipping) * Decimal(qty)
        existing_cart_items.total = existing_cart_items.sub_total + existing_cart_items.shipping 
        existing_cart_items.user = request.user if request.user.is_authenticated else None
        existing_cart_items.cart_id = cart_id
        existing_cart_items.save()

        message = 'Cart updated'
    
    total_cart_items = Cart.objects.filter(cart_id=cart_id)
    cart_sub_total = Cart.objects.filter(cart_id=cart_id).aggregate(sub_total = models.Sum("sub_total"))['sub_total']


    return JsonResponse({
        'message': message,
        'total_cart_items': total_cart_items.count(),
        'cart_sub_total': "{:,.2f}".format(cart_sub_total), # Appends comas and decimals at the end if the digits gets too long (e.g 432,133,955.50)
        'item_sub_total': "{:,.2f}".format(existing_cart_items.sub_total) if existing_cart_items else"{:,.2f}".format(cart.sub_total)
        
        })





    #  Cart View
@never_cache
def cart_view(request):
    if 'cart_id' in request.session:
        cart_id = request.session['cart_id']
    else:
        cart_id= None

    if request.user.is_authenticated:
        items = Cart.objects.filter(cart_id=cart_id, user=request.user)  
        cart_sub_total = Cart.objects.filter(cart_id=cart_id, user=request.user).aggregate(sub_total= models.Sum ('sub_total'))['sub_total'] or 0
        cart_shipping_total = Cart.objects.filter(cart_id=cart_id, user=request.user).aggregate(shipping = Sum('shipping'))['shipping'] or 0
        
        # product = Product.objects.get(status='Published', id=id)
        
        # tax = tax_calc(address.country, cart_sub_total)

    else: 
        items = Cart.objects.filter(cart_id=cart_id) if cart_id else Cart.objects.none()
        cart_sub_total = Cart.objects.filter(cart_id=cart_id).aggregate(sub_total=Sum('sub_total'))['sub_total'] or 0
        cart_shipping_total = Cart.objects.filter(cart_id=cart_id).aggregate(shipping = Sum('shipping'))['shipping'] or 0


    try:
        addresses = Address.objects.filter(user=request.user)
    except:
        addresses = None

    if not items:
        messages.warning(request, 'No items in your cart')
        return render(request, 'core/cart_view.html', {'clear_cart': True, 'cart_sub_total': 0, 'items': [], 'addresses': addresses, 'cart_shipping_total': 0})
        # return redirect('core:index')
    

    context = {
        'cart_sub_total':cart_sub_total,
        'items': items,
        'addresses': addresses,
        'cart_shipping_total': cart_shipping_total,
    }

    return render(request, 'core/cart_view.html', context)




    # Delete Cart Item
def delete_cart_item(request):
    id = request.GET.get('id')
    item_id = request.GET.get('item_id')
    cart_id = request.GET.get('cart_id')

    if not id and not item_id and not cart_id:
        return JsonResponse({'error': 'Item or Product ID not found'}, status=400)
    
    try:
        product = Product.objects.get(status='Published', id=id)
    except Product.DoesNotExist:
        return JsonResponse({'error': 'Product not found'}, status=404)
    
    if request.user.is_authenticated:
        item = Cart.objects.get(product=product, id=item_id)
        item.delete()

        total_cart_items = Cart.objects.filter(cart_id=cart_id, user=request.user).count()
        cart_sub_total = Cart.objects.filter(cart_id=cart_id, user=request.user).aggregate(sub_total= models.Sum ('sub_total'))['sub_total'] or 0
    else:
        item = Cart.objects.get(product=product, id=item_id)
        item.delete()

        total_cart_items = Cart.objects.filter(cart_id=cart_id).count()
        cart_sub_total = Cart.objects.filter(cart_id=cart_id).aggregate(sub_total= models.Sum ('sub_total'))['sub_total'] or 0


    return JsonResponse({
        'message':'Item deleted',
        'total_cart_items': total_cart_items,
        'cart_sub_total': "{:,.2f}".format(cart_sub_total) if cart_sub_total else 0.00
    })




        # Create Order
@login_required(login_url='userauths:sign_in')
@require_POST
def create_order(request):
    address_id = request.POST.get('address')

    if not address_id:
        messages.warning(request, 'Please select an address to continue')
        return redirect('core:cart_view')

    address = Address.objects.filter(user=request.user, id=address_id).first()
    if not address:
        messages.error(request, 'Invalid address selected')
        return redirect('core:cart_view')

    # Get cart_id from session
    cart_id = request.session.get('cart_id')
    if not cart_id:
        messages.error(request, 'No cart found')
        return redirect('core:cart_view')

    # Get cart items
    items = Cart.objects.filter(cart_id=cart_id, user=request.user)
    if not items:
        messages.error(request, 'Your cart is empty')
        return redirect('core:cart_view')

    cart_sub_total = items.aggregate(sub_total=Sum('sub_total'))['sub_total'] or 0
    cart_shipping_total = items.aggregate(shipping=Sum('shipping'))['shipping'] or 0

    # Check for an existing order with payment_status='Processing' for the user
    existing_order = Order.objects.filter(customer=request.user, payment_status='Processing').first()

    with transaction.atomic():
        if existing_order:
            # Update existing order
            existing_order.sub_total = cart_sub_total
            existing_order.address = address
            existing_order.shipping = cart_shipping_total
            existing_order.tax = tax_calc(address.country, cart_sub_total)
            existing_order.total = existing_order.sub_total + existing_order.shipping + Decimal(existing_order.tax)
            existing_order.service_fee = calc_service_fee(existing_order.total)
            existing_order.total += existing_order.service_fee
            existing_order.initial_total = existing_order.total
            existing_order.save()

            # Delete existing order items to avoid duplicates
            existing_order.orderitem_set.all().delete()

            # Recreate order items
            for item in items:
                OrderItem.objects.create(
                    order=existing_order,
                    product=item.product,
                    qty=item.qty,
                    color=item.color or "Not Selected",
                    size=item.size or "Not Selected",
                    price=item.price,
                    sub_total=item.sub_total,
                    shipping=item.shipping,
                    tax=tax_calc(address.country, item.sub_total),
                    total=item.total,
                    initial_total=item.total,
                    vendor=item.product.vendor
                )
                existing_order.vendors.add(item.product.vendor)

            order = existing_order
        else:
            # Create new order
            order = Order()
            order.sub_total = cart_sub_total
            order.customer = request.user
            order.address = address
            order.shipping = cart_shipping_total
            order.tax = tax_calc(address.country, cart_sub_total)
            order.total = order.sub_total + order.shipping + Decimal(order.tax)
            order.service_fee = calc_service_fee(order.total)
            order.total += order.service_fee
            order.initial_total = order.total
            order.payment_status = 'Processing'  # Set initial payment_status to 'Processing'
            order.save()

            # Create order items
            for item in items:
                OrderItem.objects.create(
                    order=order,
                    product=item.product,
                    qty=item.qty,
                    color=item.color or "Not Selected",
                    size=item.size or "Not Selected",
                    price=item.price,
                    sub_total=item.sub_total,
                    shipping=item.shipping,
                    tax=tax_calc(address.country, item.sub_total),
                    total=item.total,
                    initial_total=item.total,
                    vendor=item.product.vendor
                )
                order.vendors.add(item.product.vendor)

    return redirect('core:checkout', order.oid)




        # Apply Coupon 
@login_required(login_url='userauths:sign_in')
def apply_coupon(request, oid):

    # Get the particular order by getting the order id and check if it exists
    try:
        order = Order.objects.get(oid=oid)
        order_items = OrderItem.objects.filter(order=order)
    except Order.DoesNotExist:
        messages.error(request, 'Order not found')
        return redirect('core:cart_view' )
    #########################################################
    
    # If User tries to submit a coupon 
    if request.method == 'POST':
        coupon_code = request.POST.get('code')  # Coupon Code

        # If user submits a coupon without filling anything in the input
        if not coupon_code:
            messages.warning(request, "No coupon applied")
            return redirect("core:checkout", order.oid)
        #################################################### 

        # Check if Coupon exists
        try:
            coupon = Coupon.objects.get(code=coupon_code, active=True, used=False)
        except Coupon.DoesNotExist:
            messages.error(request, 'Coupon Does Not Exist')
            return redirect('core:checkout', oid=oid) 
        # ##########################################

        # Check if coupon has already been used
        if coupon.used:
            messages.error(request, 'This coupon has already been used')
            return redirect('core:checkout', oid=oid)
        

        if not coupon.active:
            messages.error(request, 'This coupon is not active')
            return redirect('core:checkout', oid=order.oid)
        
        
        
        total_discount = Decimal('0.00')
        # Check if that particular coupon is related to a particular Vendor's product in the useer's cart so users can apply more than one coupon in a order
        for item in order_items:
            if coupon.vendor == item.product.vendor and coupon not in item.coupon.all():
                item_sub_total = Decimal(item.sub_total)
                coupon_discount = Decimal(coupon.discount)
                item_discount = item_sub_total * coupon_discount / Decimal('100')
                total_discount += item_discount

                item.coupon.add(coupon)
                item.sub_total -= item_discount  # Subtract discount from item sub total
                item.saved += item_discount  # Assign the discount to the item saved 
                item.save()
        
        # Update order if a discount was applied
        if total_discount > 0:
            try:
                # Convert shipping, tax, and service fee to Decimal
                shipping = Decimal(order.shipping or 0)
                tax = Decimal(order.tax or 0)
                service_fee = Decimal(order.service_fee or 0)

                # Update order totals
                order.sub_total = Decimal(order.sub_total) - total_discount
                order.total = order.sub_total + shipping + tax + service_fee
                order.saved += total_discount

                # Mark coupon as used and save
                coupon.used = True
                coupon.save()
                order.coupons.add(coupon)
                order.save()

                messages.success(request, 'Coupon applied successfully')
            except (InvalidOperation, TypeError):
                messages.error(request, 'Error processing order totals')
                return redirect('core:checkout', oid=order.oid)
        else:
            messages.error(request, 'Coupon not applicable to any item in this order')

    return redirect('core:checkout', oid=order.oid)





#         # Checkout
@login_required(login_url='userauths:sign_in')
def checkout(request, oid):
    
    order =  Order.objects.get(oid=oid)


    amount_in_inr = convert_usd_to_inr(order.total)
    amount_in_ngn = convert_usd_to_ngn(order.total)
    amount_in_kobo = convert_usd_to_kobo(order.total)

    


    context = {
        'order':order,
        'stripe_public_key': settings.STRIPE_PUBLIC_KEY,
        'paystack_public_key': settings.PAYSTACK_PUBLIC_KEY,
        'amount_in_inr': amount_in_inr,
        'amount_in_ngn': amount_in_ngn,
        'amount_in_kobo': amount_in_kobo,
        'flutterwave_public_key': settings.FLUTTERWAVE_PUBLIC_KEY,


    }

    return render(request, 'core/checkout.html', context)







            # SEARCH PRODUCT
def search_products(request):
    query = request.GET.get("q", "")
    
    products = Product.objects.filter(name__icontains=query)[:10]

    data = {
        "products": [
            {
                "name": p.name,
                "slug": p.slug
            }
            for p in products
        ]
    }

    return JsonResponse(data)
############################################################################################################3 



############################# PAYMENT INTEGRATIONS #############################################################

        # Payment Status
@login_required(login_url='userauths:sign_in')
def payment_status(request, oid):

    order = get_object_or_404(Order, oid=oid)

    # must be owner
    if order.customer != request.user:
        return redirect('core:index')  # or 403 page

    

    payment_status = request.GET.get("payment_status")

    context = {
        "order": order,
        "payment_status": payment_status
    }

    return render(request, "core/payment_status.html", context)






        # Stripe Payment
@login_required(login_url='userauths:sign_in')        
@csrf_exempt
def stripe_payment(request, oid):
    order = Order.objects.get(oid=oid)
    stripe.api_key = settings.STRIPE_SECRET_KEY

    checkout_session = stripe.checkout.Session.create(
        customer_email = order.address.email,
        payment_method_types = ['card'],
        line_items = [
            {
                'price_data': {
                    'currency': 'USD',
                    'product_data': {
                        'name': order.address.full_name
                    },
                    'unit_amount': int(order.total * 100)
                },
                'quantity': 1
            }
        ],
        mode = 'payment',
        success_url= request.build_absolute_uri(reverse('core:stripe_payment_verify', args=[order.oid])) + '?session_id={CHECKOUT_SESSION_ID}' + '&payment_method=Stripe',
        cancel_url= request.build_absolute_uri(reverse('core:stripe_payment_verify', args=[order.oid])),

    )

    print('Checkout Session===', checkout_session)
    return JsonResponse ({'sessionId': checkout_session.id})




            # Stripe Verify Payment
@login_required(login_url='userauths:sign_in')
def stripe_payment_verify(request, oid):
    order = Order.objects.get(oid=oid)
    stripe.api_key = settings.STRIPE_SECRET_KEY

    session_id = request.GET.get('session_id')
    session = stripe.checkout.Session.retrieve(session_id)

    if session.payment_status == 'paid':
        if order.payment_status == 'Processing':
            order.payment_status = 'Paid'
            order.payment_method = 'Stripe'
            order.save()

            for item in order.order_items():
                    product = item.product

                    if product.stock >= item.qty:
                        product.stock -= item.qty
                        product.save()
                    else:
                        return redirect(f"/payment_status/{order.oid}/?payment_status=out_of_stock")
            clear_cart_items(request)


            
            # Email Customer
            # customer_merge_data = {
            #     'order':order,
            #     'order_items': order.order_items()
            # }
            # subject = f"New Order"
            # text_body = render_to_string("email/order/customer/customer_new_order.txt", customer_merge_data)
            # html_body = render_to_string("email/order/customer/customer_new_order.html", customer_merge_data)

            # msg = EmailMultiAlternatives(
            #     subject=subject, from_email=settings.FROM_EMAIL,
            #     to=[order.address.email], body=text_body
            # )

            #     # If text body is empty
            # msg.attach_alternative(html_body,'text/html')
            # msg.send()

                    # InApp Notification
            customer_models.Notifications.objects.create(
                    type="New Order",
                    user=request.user
                )


                 
            for item in order.order_items():
                
                # Email to Vendor
                # vendor_merge_data = {
                #     'item':item
                # }

            #     subject = f"New Sale"
            #     text_body = render_to_string("email/order/vendor/vendor_new_order.txt", vendor_merge_data)
            #     html_body = render_to_string("email/order/vendor/vendor_new_order.html", vendor_merge_data)

            #     msg = EmailMultiAlternatives(
            #         subject=subject, from_email=settings.FROM_EMAIL,
            #         to=[item.vendor.email], body=text_body
            #     )
            #         # If text body is empty
            #     msg.attach_alternative(html_body,'text/html')
            #     msg.send()

                    # InApp Notification
                vendor_models.Notifications.objects.create(
                    type="New Order",
                    user=item.vendor, 
                    order=item, 
                )

            return redirect (f"/payment_status/{order.oid}/?payment_status=paid")
    return redirect (f"/payment_status/{order.oid}/?payment_status=failed")
    

import ssl
print(ssl.OPENSSL_VERSION)

# import logging

# logger = logging.getLogger(__name__)












        # Paystack Payment
@login_required(login_url='userauths:sign_in')
def paystack_payment_verify(request, oid):
    order = Order.objects.get(oid=oid)
    reference = request.GET.get('reference', '')

    if reference:
        headers = {
            'Authorization': f"Bearer {settings.PAYSTACK_SECRET_KEY}",
            'Content-Type': 'application/json'
        }

        response = requests.get(f"https://api.paystack.co/transaction/verify/{reference}", headers=headers)
        response_data = response.json()
        print("Paystack Response:", response_data)  # Debug

        if response_data['status']:
            if response_data['data']['status'] == 'success':
                if order.payment_status == 'Processing':
                    order.payment_status = 'Paid'
                    order.payment_method = 'Paystack'
                    order.save()

                    for item in order.order_items():
                        product = item.product

                        if product.stock >= item.qty:
                            product.stock -= item.qty
                            product.save()
                        else:
                            return redirect(f"/payment_status/{order.oid}/?payment_status=out_of_stock")
                    
                    clear_cart_items(request)
                     
            # Email Customer
            # customer_merge_data = {
            #     'order':order,
            #     'order_items': order.order_items()
            # }
            # subject = f"New Order"
            # text_body = render_to_string("email/order/customer/customer_new_order.txt", customer_merge_data)
            # html_body = render_to_string("email/order/customer/customer_new_order.html", customer_merge_data)

            # msg = EmailMultiAlternatives(
            #     subject=subject, from_email=settings.FROM_EMAIL,
            #     to=[order.address.email], body=text_body
            # )

            #     # If text body is empty
            # msg.attach_alternative(html_body,'text/html')
            # msg.send()

                    # InApp Notification
            customer_models.Notifications.objects.create(
                    type="New Order",
                    user=request.user
                )


                 # Email to Vendor
            for item in order.order_items():
                vendor_merge_data = {
                    'item':item
                }

            #     subject = f"New Sale"
            #     text_body = render_to_string("email/order/vendor/vendor_new_order.txt", vendor_merge_data)
            #     html_body = render_to_string("email/order/vendor/vendor_new_order.html", vendor_merge_data)

            #     msg = EmailMultiAlternatives(
            #         subject=subject, from_email=settings.FROM_EMAIL,
            #         to=[item.vendor.email], body=text_body
            #     )
            #         # If text body is empty
            #     msg.attach_alternative(html_body,'text/html')
            #     msg.send()

                    # InApp Notification
                vendor_models.Notifications.objects.create(
                    type="New Order",
                    user=item.vendor, 
                    order=item, 
                )
            return redirect (f"/payment_status/{order.oid}/?payment_status=paid")
        return redirect (f"/payment_status/{order.oid}/?payment_status=failed")






        # Flutterwave payment
@login_required(login_url='userauths:sign_in')
def flutterwave_payment_callback(request, oid):
    order = Order.objects.get(oid=oid)
    tx_ref = request.GET.get('tx_ref', '')

    headers = {
            'Authorization': f"Bearer {settings.FLUTTERWAVE_SECRET_KEY}",
            'Content-Type': 'application/json'
        }
    
    response = requests.get(f"https://api.flutterwave.com/v3/transactions/verify_by_reference?tx_ref={tx_ref}", headers=headers)
    response_data = response.json()

    if response_data ['data']['status'] == 'successful':
        if order.payment_status == 'Processing':
                    order.payment_status = 'Paid'
                    order.payment_method = 'Paystack'
                    order.save()

                    for item in order.order_items():
                        product = item.product

                        if product.stock >= item.qty:
                            product.stock -= item.qty
                            product.save()
                        else:
                            return redirect(f"/payment_status/{order.oid}/?payment_status=out_of_stock")
                        
                    clear_cart_items(request)
                    return redirect (f"/payment_status/{order.oid}/?payment_status=paid")
    return redirect (f"/payment_status/{order.oid}/?payment_status=failed")



            



        

################################## PAGES #########################################

        # Order Tracker Page
def order_tracker_page(request):
    if request.method == "POST":
        item_id = request.POST.get("item_id")
        return redirect("core:order_tracker_detail", item_id)
    
    return render(request, "core/order_tracker_page.html")




        # Order Tracker Details
def order_tracker_detail(request, item_id):
    try:
        item = OrderItem.objects.filter(models.Q(item_id=item_id) | models.Q(tracking_id=item_id)).first()
    except:
        item = None
        messages.error(request, "Order not found!")
        return redirect("core:order_tracker_page")
    
    context = {
        "item": item,
    }
    return render(request, "core/order_tracker.html", context)




        # ABOUT US
def about(request):

    return render(request, 'pages/about.html')




        # CONTACT US
def contact(request):
    if request.method == 'POST':
        full_name = request.POST.get('full_name')
        email = request.POST.get('email')
        subject = request.POST.get('subject')
        message = request.POST.get('message')
    
        Contact.objects.create(
            full_name = full_name,
            email = email,
            subject = subject,
            message = message,
        )
        messages.success(request, 'Message sent successfully.')
        return redirect ('core:contact')


    return render(request, 'pages/contact.html')





        # FAQs
def faqs(request):

    return render(request, 'pages/faqs.html')




        # FAQs
def privacy_policy(request):

    return render(request, 'pages/privacy_policy.html')




        # FAQs
def terms_and_conditions(request):

    return render(request, 'pages/terms_and_conditions.html')

            









