from django.urls import path
from .views import *


app_name = 'api'


urlpatterns = [
            # FEATURED PRODUCTS
    path('featured_products', featured_products, name='featured_products' ),

            # PRODUCTS
    path('products', products, name='products' ),

            # PRODUCT DETAIL
    path('product_detail/<slug>/', product_detail, name='product_detail' ),

            # CATEGORIES
    path('category_list', category_list, name='category_list' ), 

            # CATEGORY DETAIL
    path('category_detail/<slug>/', category_detail, name='category_detail' ),

            # ADD TO CART
    path('add_to_cart/', add_to_cart, name='add_to_cart' ), 

             # UPDATE CART
    path('update_cart_quantity/', update_cart_quantity, name='update_cart_quantity' ), 


]    