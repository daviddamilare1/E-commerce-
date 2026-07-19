from decimal import Decimal
import requests
from django.core.cache import cache



def fetch_exchange_rates():
    response = requests.get('https://api.exchangerate-api.com/v4/latest/USD')
    data = response.json()

    return  {
        'INR': Decimal(data['rates']['INR']),
        'NGN': Decimal(data['rates']['NGN'])
    }



# exchange_rates = fetch_exchange_rates()

    # Get USD to Indian Rupees
def get_usd_to_inr_rates():
    return fetch_exchange_rates()['INR']

    # Get USD to Nigerian Naira
def get_usd_to_ngn_rates():
    return fetch_exchange_rates()['NGN']



    # Conver USD to Rupees
def convert_usd_to_inr(usd_amount):
    inr_rate = get_usd_to_inr_rates()
    return usd_amount * inr_rate

     # Conver USD to Nigerian Kobo
def convert_usd_to_kobo(amount):

    cached_rate = cache.get('usd_ngn_rate')

    if not cached_rate:

        cached_rate = 1600

        cache.set('usd_ngn_rate', cached_rate, 60 * 60)

    ngn = amount * cached_rate

    return int(ngn * 100)
# def convert_usd_to_kobo(usd_amount):
#     ngn_rate = get_usd_to_ngn_rates()
#     ngn_amount = usd_amount * ngn_rate
#     return int(ngn_amount * 100)

    # Conver USD to Nigerian Naira
def convert_usd_to_ngn(amount):

    cached_rate = cache.get('usd_ngn_rate')

    if not cached_rate:

        # YOUR API CALL HERE
        cached_rate = 1600

        # Cache for 1 hour
        cache.set('usd_ngn_rate', cached_rate, 60 * 60)

    return round(amount * cached_rate, 2)
# def convert_usd_to_ngn(usd_amount):
#     ngn_rate = get_usd_to_ngn_rates()
#     return usd_amount * ngn_rate

