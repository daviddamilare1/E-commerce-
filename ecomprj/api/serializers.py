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


