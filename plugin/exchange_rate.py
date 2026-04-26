from decimal import Decimal
import requests




def fetch_exchange_rates():
    response = requests.get('https://api.exchangerate-api.com/v4/latest/USD')
    data = response.json()

    return  {
        'INR': Decimal(data['rates']['INR']),
        'NGN': Decimal(data['rates']['NGN'])
    }



exchange_rates = fetch_exchange_rates()

    # Get USD to Indian Rupees
def get_usd_to_inr_rates():
    return exchange_rates['INR']

    # Get USD to Nigerian Naira
def get_usd_to_ngn_rates():
    return exchange_rates['NGN']


    # Conver USD to Rupees
def convert_usd_to_inr(usd_amount):
    inr_rate = get_usd_to_inr_rates()
    return usd_amount * inr_rate

     # Conver USD to Nigerian Kobo
def convert_usd_to_kobo(usd_amount):
    ngn_rate = get_usd_to_ngn_rates()
    ngn_amount = usd_amount * ngn_rate
    return int(ngn_amount * 100)

    # Conver USD to Nigerian Naira
def convert_usd_to_ngn(usd_amount):
    ngn_rate = get_usd_to_ngn_rates()
    return usd_amount * ngn_rate

