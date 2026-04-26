from django.urls import path
from .views import *


app_name = 'core'


urlpatterns = [
        # Home Page
    path('', index, name='index'),
    
        # SHOP
    path('shop', shop, name='shop'),


        # FILTER PRODUCTS
    path("filter_products/", filter_products, name="filter_products"),

        # CATEGORY DETAIL
    path('category_detail/<slug>/', category_detail, name='category_detail'),

        # Product details
    path('product_details/<slug>/', product_details, name='details'),
        
        # add to cart function url
    path('add_to_cart/', add_to_cart, name='add_to_cart'),

        # Cart Page
    path('cart_view', cart_view, name='cart_view'),

    path('clear_cart/', clear_cart_items, name='clear_cart'),
    path('get_cart_items/', get_cart_items, name='get_cart_items'),
    path('cancel_order/', cancel_order, name='cancel_order'),

        # Delete cart item
    path('delete_cart_item/', delete_cart_item, name='delete_cart_item'),

        # Create Order
    path('create_order/', create_order, name='create_order'),

        # Checkout
    path('checkout/<oid>/', checkout, name='checkout'),

        # Search Product
    path("search_products/", search_products, name="search_products"),

        # Apply Coupon
    path('apply_coupon/<oid>/', apply_coupon, name='apply_coupon'),

            # PAYMENT LINKS

            # Payment status
    path('payment_status/<oid>/', payment_status, name='payment_status'),
            # Stripe payment
    path('stripe_payment/<oid>/', stripe_payment, name='stripe_payment'),
            # Stripe verify payment
    path('stripe_payment_verify/<oid>/', stripe_payment_verify, name='stripe_payment_verify'),
            # Paypal verify payment
    path('paypal_payment_verify/<order_id>/', paypal_payment_verify, name='paypal_payment_verify'),

            # Paystack Payment
    path('paystack_payment_verify/<oid>/', paystack_payment_verify, name='paystack_payment_verify'),

            # Flutterwave Payment
    path('flutterwave_payment_callback/<oid>/', flutterwave_payment_callback, name='flutterwave_payment_callback'),



    ################## PAGES ##################################
                # Order Tracker Page    
    path("order_tracker_page", order_tracker_page, name="order_tracker_page"),

                # Order Tracker Details
    path("order_tracker_detail/<item_id>/", order_tracker_detail, name="order_tracker_detail"),

            # ABOUT US
    path('about', about, name='about'),

            # CONTACT US
    path('contact', contact, name='contact'),

            # FAQs
    path('faqs', faqs, name='faqs'),

            # PRIVACY POLICY
    path('privacy_policy', privacy_policy, name='privacy_policy'),

            # PRIVACY POLICY
    path('terms_and_conditions', terms_and_conditions, name='t_and_m'),





    



]

