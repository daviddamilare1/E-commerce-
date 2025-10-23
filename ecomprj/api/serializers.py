from rest_framework import serializers
from core.models import *
from userauths.models import User












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










# class CartSerializer(serializers.ModelSerializer):
#     product = ProductSerializer(read_only=True)
    
#     class Meta:
#         model = Cart
#         fields = [
#             'product',
#             # 'user',
#             'qty',
#             'price',
#             'sub_total',
#             'shipping',
#             'tax',
#             'total',
#             'size',
#             'color',
#             'cart_id',
#             # 'date',
#         ]
    


class CartSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)
    product_id = serializers.PrimaryKeyRelatedField(
        queryset=Product.objects.all(), source='product', write_only=True
    )
    user = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(), allow_null=True
    )

    class Meta:
        model = Cart
        fields = [
            'id', 'product', 'product_id', 'user', 'qty', 'price', 'sub_total',
            'shipping', 'tax', 'total', 'size', 'color', 'cart_id', 'date'
        ]
        read_only_fields = ['sub_total', 'total', 'date', 'price']

    def validate(self, data):
        """
        Validate the cart data, ensuring qty is non-negative.
        """
        if data.get('qty', 0) < 0:
            raise serializers.ValidationError("Quantity cannot be negative.")
        return data

    def create(self, validated_data):
        """
        Create a new cart instance, calculating sub_total and total.
        """
        product = validated_data['product']
        qty = validated_data['qty']
        cart = Cart.objects.create(
            **validated_data,
            price=product.price,
            sub_total=product.price * qty,
            shipping=product.shipping * qty,
            total=(product.price * qty) + (product.shipping * qty) + validated_data.get('tax', 0)
        )
        return cart

    def update(self, instance, validated_data):
        """
        Update cart instance, recalculating sub_total and total.
        """
        product = validated_data.get('product', instance.product)
        qty = validated_data.get('qty', instance.qty)
        instance.product = product
        instance.user = validated_data.get('user', instance.user)
        instance.qty = qty
        instance.price = product.price
        instance.shipping = product.shipping * qty
        instance.tax = validated_data.get('tax', instance.tax)
        instance.size = validated_data.get('size', instance.size)
        instance.color = validated_data.get('color', instance.color)
        instance.cart_id = validated_data.get('cart_id', instance.cart_id)
        instance.sub_total = product.price * qty
        instance.total = instance.sub_total + instance.shipping + instance.tax
        instance.save()
        return instance

    






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
