from django.shortcuts import render

from .serializers import *
from core.models import *

from rest_framework.decorators import api_view
from rest_framework.response import Response







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




#         # CART
# @api_view(['GET'])
# def ca

















