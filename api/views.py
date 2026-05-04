from django.shortcuts import render

from .serializers import *
from core.models import *
from customer.models import Address

from rest_framework.decorators import api_view
from rest_framework.response import Response

from django.db.models import Sum
from decimal import Decimal

from django.contrib import messages
from rest_framework import status
import uuid






        # FEATURED PRODUCTS
@api_view(['GET'])
def featured_products(request):
    products = Product.objects.filter(status='Published', featured=True)
    serializer = ProductSerializer(products, many=True)

    return Response(serializer.data)


        # PRODUCTS
@api_view(['GET'])
def products(request):
    products = Product.objects.filter(status='Published')
    serializer = ProductSerializer(products, many=True)

    return Response(serializer.data)


        # PRODUCT DETAIL
@api_view(['GET'])
def product_detail(request,slug):
    product = Product.objects.filter(status='Published')
    serializer = ProductSerializer(product)

    return Response(serializer.data)



        # CATEGORY LIST
@api_view(['GET'])
def category_list(request):
    categories = Category.objects.all()
    serializer = CategoryListSerializer(categories, many=True)

    return Response(serializer.data)



        # CATEGORY DETAIL
@api_view(['GET'])
def category_detail(request, slug):
    category = Category.objects.get(slug=slug)
    serializer = CategoryDetailSerializer(category)

    return Response(serializer.data)




        # ADD TO CART
@api_view(['POST'])
def add_to_cart(request):
    
    cart_id = request.data.get('cart_id')
    items = request.data.get('items', [request.data])  # Treat single item as a list if no 'items'

    if not cart_id:
        return Response({'error': 'No cart_id provided'}, status=400)
    if not items:
        return Response({'error': 'No items provided'}, status=400)


    responses = []
    for i in items:
        id = i.get('id')
        qty = i.get('qty')
        color = i.get('color')
        size = i.get('size')

       

        if not id or not qty or not cart_id:
            return Response({'error': ' No id, qty or cart_id'}, status=400)
        

        try:
            product = Product.objects.get(status='Published', id=id)

        except Product.DoesNotExist:
            return Response({'error': 'Product not found'}, status=404)
        
        existing_cart_items = Cart.objects.filter(cart_id=cart_id, product=product).first()

        if int(qty) > product.stock:
            return Response({'error': 'Qty exceed current stock amount'}, status=404)
        
        qty = int(qty)
        if qty <= 0:
            return Response({'error': 'Quantity must be a positive number'}, status=400)
        
        if not existing_cart_items:
            cart = Cart()
            cart.product = product
            cart.qty = qty
            cart.price = product.price
            cart.color = color if color else None
            cart.size = size if size else None
            cart.sub_total = Decimal(product.price) * Decimal(qty)
            cart.shipping = Decimal(product.shipping) * Decimal(qty)
            cart.total = cart.sub_total + cart.shipping 
            cart.user = request.user if request.user.is_authenticated else None
            cart.cart_id = cart_id
            cart.save()

            message = 'Item added to cart'
            serialized_items = CartSerializer(cart).data


        else:
            existing_cart_items.product = product
            existing_cart_items.qty = qty
            existing_cart_items.price = product.price
            existing_cart_items.color = color or existing_cart_items.color if color or existing_cart_items.color else None
            existing_cart_items.size = size or existing_cart_items.size if size or existing_cart_items.size else None
            existing_cart_items.sub_total = Decimal(product.price) * Decimal(qty)
            existing_cart_items.shipping = Decimal(product.shipping) * Decimal(qty)
            existing_cart_items.total = existing_cart_items.sub_total + existing_cart_items.shipping 
            existing_cart_items.user = request.user if request.user.is_authenticated else None
            existing_cart_items.cart_id = cart_id
            existing_cart_items.save()

            message = 'Cart updated'
            serialized_items = CartSerializer(existing_cart_items).data
        
        responses.append({
            'id': id,
            'message': message,
            'item_sub_total': "{:,.2f}".format(Decimal(serialized_items['sub_total'])),
            'cart_item': serialized_items
        })
        
    total_cart_items = Cart.objects.filter(cart_id=cart_id)
    cart_sub_total = Cart.objects.filter(cart_id=cart_id).aggregate(sub_total = models.Sum("sub_total"))['sub_total']
   
    all_cart_items = CartSerializer(total_cart_items, many=True).data
    cart_total = Cart.objects.filter(cart_id=cart_id).aggregate(total = models.Sum("total"))['total']

   
    return Response({
        'processed_response': responses,
        'message': 'Processed all cart items',
        'total_cart_items': total_cart_items.count(),
        'all_cart_items': all_cart_items,
        'cart_sub_total': "{:,.2f}".format(cart_sub_total), # Appends comas and decimals at the end if the digits gets too long (e.g 432,133,955.50)
        # 'cart_total': "{:,.2f}".format(cart_total) 
        
        
        })





        # CART VIEW
@api_view(['GET'])
def cart_view(request):
    cart_id = request.GET.get('cart_id') or request.session.get('cart_id') 
    if not cart_id:
        cart_id = str(uuid.uuid4())
        request.session['cart_id'] = cart_id
    
    product = Product.objects.filter(status='Published')

    responses = []
    if request.user.is_authenticated:
        cart = Cart.objects.filter(user=request.user, cart_id=cart_id)
        items = Cart.objects.filter(user=request.user, cart_id=cart_id, product__in=product)
        cart_sub_total = Cart.objects.filter(cart_id=cart_id, user=request.user).aggregate(sub_total = models.Sum("sub_total"))['sub_total'] or 0
        cart_shipping_total = Cart.objects.filter(cart_id=cart_id, user=request.user).aggregate(shipping = Sum('shipping'))['shipping'] or 0

        serializer = CartSerializer(cart, many=True).data
        items_serializer = CartViewSerializer(items, many=True).data

    else:
        cart = Cart.objects.filter(cart_id=cart_id)
        items = Cart.objects.filter(cart_id=cart_id, product__in=product)
        cart_sub_total = Cart.objects.filter(cart_id=cart_id).aggregate(sub_total = models.Sum("sub_total"))['sub_total'] or 0
        cart_shipping_total = Cart.objects.filter(cart_id=cart_id).aggregate(shipping = Sum('shipping'))['shipping'] or 0


        serializer = CartSerializer(cart, many=True).data
        items_serializer = CartViewSerializer(items, many=True).data

    
    responses.append({
        'processed-response': serializer,
        'items': items_serializer,
        # 'item_sub_total': items.sub_total,
        'cart_shipping_total': cart_shipping_total,
        'cart_sub_total': cart_sub_total,

    })

    
    try:
        addresses = Address.objects.filter(user=request.user)
        
    except:
        addresses = None
    
    addresses_serializer = AddressSerializer(addresses, many=True)


    if not items:
        messages.warning(request, 'No items in cart')
        return Response(responses, status=status.HTTP_200_OK)
    # return Response(responses, status=status.HTTP_200_OK)

    print("Cart ID:", request.session.get('cart_id'))
    return Response ({
        'response': responses,
        'addresses': addresses_serializer,

    })














