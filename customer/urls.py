from django.urls import path
from .views import *


app_name = 'customer'


urlpatterns = [

            # DASHBOARD
    path('dashboard', c_dashboard, name='dashboard'),

            # ORDERS
    path('order_list', order_list, name='order_list'),

            # ORDER DETAILS
    path('order_details/<oid>/', order_details, name='order_details'),

            # ORDER ITEM DETAIL
    path('order_item_detail/<oid>/<item_id>/', order_item_detail, name='order_item_detail'),
    
            # WISHLIST 
    path('wishlist', wishlist, name='wishlist'),

            # Remove Item from WISHLIST
    path('remove_wishlist/<id>/', remove_wishlist, name='remove_wishlist'),

            # Add Item to Wishlist
    path('add_to_wishlist/<id>/', add_to_wishlist, name='add_to_wishlist'),

            # NOTIFICATIONS
    path('notifications', notifications, name='notifications'),

            # Mark Notification as seen
    path('mark_noti_seen/<id>/', mark_noti_seen, name='mark_noti_seen'),

            # CREATE ADDRESS
    path('create_address', create_address, name='create_address'),

            # ADDRESS
    path('addresses', address, name='addresses'),

            # ADRESS DETAILS
    path('address_details/<id>/', address_details, name='address_details'),

            # DELETE ADDRESS
    path('delete_address/<id>/', delete_address, name='delete_address'),

        # PROFILE
    path('profile', profile, name='profile'),

        # CHANGE PASSWORD
    path('change_password', change_password, name='change_password'),
    




    




    
]
