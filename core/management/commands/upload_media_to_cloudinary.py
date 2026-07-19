from django.core.management.base import BaseCommand
from core.models import Product
import cloudinary
import cloudinary.uploader
import os
from django.conf import settings


class Command(BaseCommand):
    help = "Upload existing media files to Cloudinary"

    def handle(self, *args, **kwargs):

        # 🔥 FORCE CLOUDINARY CONFIG HERE
        cloudinary.config(
            cloud_name=settings.CLOUDINARY_STORAGE['CLOUD_NAME'],
            api_key=settings.CLOUDINARY_STORAGE['API_KEY'],
            api_secret=settings.CLOUDINARY_STORAGE['API_SECRET']
        )

        for product in Product.objects.all():

            if product.image:
                local_path = product.image.path

                if os.path.exists(local_path):
                    self.stdout.write(f"Uploading {local_path}")

                    result = cloudinary.uploader.upload(local_path)

                    product.image = result['secure_url']
                    product.save()

        self.stdout.write(self.style.SUCCESS("Done uploading media"))