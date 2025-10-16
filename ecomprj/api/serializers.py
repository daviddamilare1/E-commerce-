from rest_framework import serializers
from core.models import *












class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            'name',
            'image',
            'category',
            'desc',
            'price',
            'slug',

        ]




class ProductDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            'name',
            'image',
            'category',
            'desc',
            'price',
            'regular_price',
            'stock',
            'slug',
        
        ]





class CategoryListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = [
            'title',
            'image',
            'slug',
        
        ]



class CategoryDetailSerializer(serializers.ModelSerializer):
    products = ProductSerializer(many=True, read_only=True)
    class Meta:
        model = Category
        fields = [
            'title',
            'image',
            'slug',
            'products',
        
        ]










class CartSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)
    
    class Meta:
        model = Cart
        fields = [
            'product',
            # 'user',
            'qty',
            'price',
            'sub_total',
            'shipping',
            'tax',
            'total',
            'size',
            'color',
            'cart_id',
            # 'date',
        ]
    


    






# class OrderItemSerializer(serializers.ModelSerializer):
#     product = ProductSerializer(read_only=True)
#     sub_total = serializers.SerializerMethodField()
#     class Meta:
#         model = OrderItem
#         fields = [
#             # 'order',
#             # 'order_status',
#             # 'shipping_service',
#             # 'tracking_id',
#             'product',
#             'qty',
#             'color',
#             'size',
#             'price',
#             'sub_total',
#             'shipping',
#             'tax',
#             'total',
#             'initial_total',
#             'saved',
#             'coupon',
#             'applied_coupon',
#             'item_id',
#             'vendor',
#             # 'date',
#         ]


        # def get_sub_total(self, orderitem):
        #     total = orderitem.product.price * orderitem.qty
        #     return total
