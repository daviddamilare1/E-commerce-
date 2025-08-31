from django.urls import path
from .views import *


app_name = 'vendor'


urlpatterns = [
        # DASHBAORD 
    path('dashboard', dashboard, name='dashboard'),

        # PRODUCTS
    path('products', products, name='products'),

        # ORDERS
    path('orders', orders, name='orders'),

        # ORDER DETAILS
    path('order_details/<oid>/', order_details, name='order_details'),

        # ORDER ITEM DETAIL 
    path('order_item_detail/<oid>/<item_id>/', order_item_detail, name='order_item_detail'),

        # UPDATE ORDER STATUS
    path('update_order_status/<oid>/', update_order_status, name='update_order_status'),

        # UPDATE ORDER ITEM STATUS
    path('update_order_item_status/<oid>/<item_id>/', update_order_item_status, name='update_order_item_status'),

        # COUPONS
    path('coupons', coupons, name='coupons'),

        # CREATE COUPON
    path('create_coupon', create_coupon, name='create_coupon'),

        # UPDATE COUPON
    path('update_coupon/<id>/', update_coupon, name='update_coupon'),

        # DELETE COUPON
    path('delete_coupon/<id>/', delete_coupon, name='delete_coupon'),

        # REVIEWS
    path('reviews', reviews, name='reviews'),

        # REPLY REVIEW
    path('reply/<id>/', reply, name='reply'),

        # NOTIFICATIONS
    path('notifications', notifications, name='notifications'),

        # MARK NOTIFICATION AS SEEN
    path('mark_noti_seen/<id>/', mark_noti_seen, name='mark_noti_seen'),

        #  VIEW AND UPDATE PROFILE
    path('profile', profile, name='profile'),

        # CHANGE PASSWORD
    path('change_password', change_password, name='change_password'),

        # CREATE PRODUCT
    path('create_product', create_product, name='create_product'),

        # UPDATE PRODUCT
    # path('create_product', create_product, name='create_product'),








]
