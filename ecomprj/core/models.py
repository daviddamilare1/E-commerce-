from django.db import models
from shortuuid.django_fields import ShortUUIDField
from django.utils import timezone
from django.utils.text import slugify
from django_ckeditor_5.fields import CKEditor5Field

from userauths import models as user_models
from vendor import models as vendor_models

import shortuuid
from django.utils.html import mark_safe




################### CHOICES ###########################################
STATUS = (
    ("Published", "Published"),
    ("Draft", "Draft"),
    ("Disabled", "Disabled"),
)

PAYMENT_STATUS = (
    ("Paid", "Paid"),
    ("Processing", "Processing"),
    ("Failed", 'Failed'),
)

PAYMENT_METHOD = (
    ("PayPal", "PayPal"),
    ("Stripe", "Stripe"),
    ("Flutterwave", "Flutterwave"),
    ("Paystack", "Paystack"),
    ("RazorPay", "RazorPay"),
)

ORDER_STATUS = (
    ("Pending", "Pending"),
    ("Processing", "Processing"),
    ("Shipped", "Shipped"),
    ("Delivered", "Delivered"),
    ("Cancelled", "Cancelled"),
)

SHIPPING_SERVICE = (
    ("DHL", "DHL"),
    ("FedX", "FedX"),
    ("UPS", "UPS"),
    ("GIG Logistics", "GIG Logistics")
)


RATING = (
    ( 1,  "★☆☆☆☆"),
    ( 2,  "★★☆☆☆"),
    ( 3,  "★★★☆☆"),
    ( 4,  "★★★★☆"),
    ( 5,  "★★★★★"),
)

###########################################################


############### Generate ID ##################

        # Sku
def generate_sku_id():
    alphabet = "abcdefgh12345"  # Custom alphabet
    return f"sku_{shortuuid.ShortUUID(alphabet=alphabet).random(length=5)}"


        # GID
def generate_gid():
    alphabet = "abcdefgh12345"  # Custom alphabet
    return f"gid_{shortuuid.ShortUUID(alphabet=alphabet).random(length=5)}"



       # OID
def generate_oid():
    alphabet = "abcdefghijklmno12345"  # Custom alphabet
    return f"oid_{shortuuid.ShortUUID(alphabet=alphabet).random(length=5)}"




###########################################################






        # CATEGORY
class Category(models.Model):
    title = models.CharField(max_length=255)
    image = models.ImageField(upload_to='images', default='category.jpg', null=True, blank=True)
    slug = models.SlugField(unique=True)



    def __str__(self):
        return self.title
    

    class Meta:
        verbose_name_plural = 'Categories' 

    def category_image(self):
        return mark_safe('<img src= "%s" width="50" height="50" />' % (self.image.url))
    



        # PRODUCT
class Product(models.Model):
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='images', null=True, blank=True, default='product.jpg')
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True, blank=True)
    desc = CKEditor5Field('Text', config_name='extends')

    price = models.DecimalField(max_digits=12, decimal_places=2, default=0.00, null=True, blank=True, verbose_name="Sale Price")
    regular_price = models.DecimalField(max_digits=12, decimal_places=2, default=0.00, null=True, blank=True, verbose_name="Regular Price")

    stock = models.PositiveIntegerField(default=0, null=True, blank=True)
    shipping = models.DecimalField(max_digits=12, decimal_places=2, default=0.00, null=True, blank=True, verbose_name="Shipping Amount")
    
    status = models.CharField(choices=STATUS, max_length=50, default="Published")
    featured = models.BooleanField(default=False, verbose_name="Marketplace Featured")
    
    vendor = models.ForeignKey(user_models.User, on_delete=models.SET_NULL, null=True, blank=True)
    
    sku = models.CharField(max_length=20, unique=True, default=generate_sku_id)
    slug = models.SlugField(null=True, blank=True)
    
    date = models.DateTimeField(default=timezone.now)

    class Meta:
        ordering = ['-id']
        verbose_name_plural = "Products"

    def __str__(self):
        return self.name
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name) + "-" + str(shortuuid.uuid().lower()[:2])
        super(Product, self).save(*args, **kwargs)

    def product_image(self):
        return mark_safe('<img src= "%s" width="50" height="50" />' % (self.image.url))
    

    def average_rating(self):
        return Review.objects.filter(product=self).aggregate(avg_rating=models.Avg('rating'))['avg_rating']
    
    def reviews(self):
        return Review.objects.filter(product=self)

    def gallery(self):
        return Gallery.objects.filter(product=self)
  
    def variants(self):
        return Variant.objects.filter(product=self)

    def vendor_orders(self):
        return OrderItem.objects.filter(product=self, vendor=self.vendor)




        # VARIANT
class Variant(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE,  null=True)
    name = models.CharField(max_length=255, verbose_name='Variant Name', null=True, blank=True)

    def items(self):
        return VariantItem.objects.filter(variant=self)
    
    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = 'Variants' 




        # VARIANT ITEM
class VariantItem(models.Model):
    variant = models.ForeignKey(Variant, on_delete=models.CASCADE, related_name='variant_items')
    title = models.CharField(max_length=1000, verbose_name="Item Title", null=True, blank=True)
    content = models.CharField(max_length=1000, verbose_name="Item Content", null=True, blank=True)

    def __str__(self):
        return self.variant.name
    
    class Meta:
        verbose_name_plural = 'Variant Items' 
    

        # GALLERY
class Gallery(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    image = models.ImageField(upload_to='images', default='gallery.jpg')
    gid = models.CharField(max_length=20, unique=True, default=generate_gid)


    def __str__(self):
        return f"{self.product.name} - image"
    

    class Meta:
        verbose_name_plural = 'Gallery' 
    

     
    


        # CART
class Cart(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(user_models.User, on_delete=models.SET_NULL, null=True, blank=True)
    qty = models.PositiveIntegerField(default=0, null=True, blank=True)
    price = models.DecimalField(decimal_places=2, max_digits=12, default=0.00, null=True, blank=True)
    sub_total = models.DecimalField(decimal_places=2, max_digits=12, default=0.00, null=True, blank=True)
    shipping = models.DecimalField(decimal_places=2, max_digits=12, default=0.00, null=True, blank=True)
    tax = models.DecimalField(decimal_places=2, max_digits=12, default=0.00, null=True, blank=True)
    total = models.DecimalField(decimal_places=2, max_digits=12, default=0.00, null=True, blank=True)
    size = models.CharField(max_length=100, null=True, blank=True)
    color = models.CharField(max_length=100, null=True, blank=True)
    cart_id = models.CharField(max_length=1000, null=True, blank=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.cart_id} - {self.product.name}'
    




        # COUPON
class Coupon(models.Model):
    vendor = models.ForeignKey(user_models.User, on_delete=models.SET_NULL, null=True)
    code = models.CharField(max_length=100)
    discount = models.IntegerField(default=1)
    active = models.BooleanField(default=True)
    used = models.BooleanField(default=False)
    
    def __str__(self):
        return self.code
    

    class Meta:
        verbose_name_plural = 'Coupons' 
    



        # ORDER
class Order(models.Model):
    vendors = models.ManyToManyField(user_models.User, blank=True)
    customer = models.ForeignKey(user_models.User, on_delete=models.SET_NULL, null=True, related_name="customer", blank=True)
    sub_total = models.DecimalField(default=0.00, max_digits=12, decimal_places=2)
    shipping = models.DecimalField(default=0.00, max_digits=12, decimal_places=2)
    tax = models.DecimalField(default=0.00, max_digits=12, decimal_places=2)
    service_fee = models.DecimalField(default=0.00, max_digits=12, decimal_places=2)
    total = models.DecimalField(default=0.00, max_digits=12, decimal_places=2)
    payment_status = models.CharField(max_length=100, choices=PAYMENT_STATUS, default="Processing")
    payment_method = models.CharField(max_length=100, choices=PAYMENT_METHOD, default=None, null=True, blank=True)
    order_status = models.CharField(max_length=100, choices=ORDER_STATUS, default="Pending")
    initial_total = models.DecimalField(default=0.00, max_digits=12, decimal_places=2, help_text="The original total before discounts")
    saved = models.DecimalField(max_digits=12, decimal_places=2, default=0.00, null=True, blank=True, help_text="Amount saved by customer")
    address = models.ForeignKey("customer.Address", on_delete=models.SET_NULL, null=True, blank=True)
    coupons = models.ManyToManyField(Coupon, blank=True)

    oid = models.CharField(max_length=20, unique=True, default=generate_oid)
    

    payment_id = models.CharField(null=True, blank=True, max_length=1000)
    date = models.DateTimeField(default=timezone.now)
    
    class Meta:
        verbose_name_plural = "Orders"
        ordering = ['-date']

    def __str__(self):
        return self.oid

    def order_items(self):
        return OrderItem.objects.filter(order=self)
    
    
        # ORDER ITEM
class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    order_status = models.CharField(max_length=100, choices=ORDER_STATUS, default="Pending")
    shipping_service = models.CharField(max_length=100, choices=SHIPPING_SERVICE, default=None, null=True, blank=True)
    tracking_id = models.CharField(max_length=100, default=None, null=True, blank=True)

    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    qty = models.IntegerField(default=0)
    color = models.CharField(max_length=100, null=True, blank=True)
    size = models.CharField(max_length=100, null=True, blank=True)
    price = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)
    sub_total = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)
    shipping = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)
    tax = models.DecimalField(default=0.00, max_digits=12, decimal_places=2)
    total = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)
    initial_total = models.DecimalField(max_digits=12, decimal_places=2, default=0.00, help_text="Grand Total of all amount listed above before discount")
    saved = models.DecimalField(max_digits=12, decimal_places=2, default=0.00, null=True, blank=True, help_text="Amount saved by customer")
    coupon = models.ManyToManyField(Coupon, blank=True)
    applied_coupon = models.BooleanField(default=False)
    item_id = ShortUUIDField(length=6, max_length=25, alphabet="1234567890")
    vendor = models.ForeignKey(user_models.User, on_delete=models.SET_NULL, null=True, related_name="vendor_order_items")
    date = models.DateTimeField(default=timezone.now)

    def order_id(self):
        return f"{self.order.oid}"
  
    def __str__(self):
        return self.item_id
    
    class Meta:
        ordering = ['-date']
        verbose_name_plural = 'Order Items'







        # REVIEW
class Review(models.Model):
    user = models.ForeignKey(user_models.User, on_delete=models.SET_NULL, blank=True, null=True)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, blank=True, null=True, related_name="reviews")
    review = models.TextField(null=True, blank=True)
    reply = models.TextField(null=True, blank=True)
    rating = models.IntegerField(choices=RATING, default=None)
    active = models.BooleanField(default=False)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} review on {self.product.name}"
    

    class Meta:
        verbose_name_plural = 'Reviews' 
        



    