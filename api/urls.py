from django.urls import path
from .views import *


app_name = 'api'


urlpatterns = [
            # FEATURED PRODUCTS
    path('api/featured_products/', featured_products, name='featured_products' ),

            # PRODUCTS
    path('api/products/', products, name='products' ),

            # PRODUCT DETAIL
    path('api/product_detail/<slug>/', product_detail, name='product_detail' ),

            # CATEGORIES
    path('api/category_list/', category_list, name='category_list' ), 

            # CATEGORY DETAIL
    path('api/category_detail/<slug>/', category_detail, name='category_detail' ),

            # ADD TO CART
    path('api/add_to_cart/', add_to_cart, name='add_to_cart' ), 

              # CART VIEW
    path('api/cart_view/', cart_view, name='cart_view' ),
        
    



]    