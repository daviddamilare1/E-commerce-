from django.shortcuts import render

from .serializers import *
from core.models import *

from rest_framework.decorators import api_view
from rest_framework.response import Response

from django.db.models import Sum
from decimal import Decimal







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
    id = request.data.get('id')
    qty = request.data.get('qty')
    color = request.data.get('color')
    size = request.data.get('size')
    cart_id = request.data.get('cart_id')
    print('Color ===', color)
    print('Size ===', size)

    request.session['cart_id'] = cart_id

    if not id or not qty or not cart_id:
        return Response({'error': ' No id, qty or cart_id'}, status=400)
    

    try:
        product = Product.objects.get(status='Published', id=id)

    except Product.DoesNotExist:
        return Response({'error': 'Product not found'}, status=404)
    
    existing_cart_items = Cart.objects.filter(cart_id=cart_id, product=product).first()
    if int(qty) > product.stock:
        return Response({'error': 'Qty exceed current stock amount'}, status=404)
    
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


    return Response({
        'message': message,
        'total_cart_items': total_cart_items.count(),
        'cart_sub_total': "{:,.2f}".format(cart_sub_total), # Appends comas and decimals at the end if the digits gets too long (e.g 432,133,955.50)
        'item_sub_total': "{:,.2f}".format(existing_cart_items.sub_total) if existing_cart_items else"{:,.2f}".format(cart.sub_total)
        
        })





















