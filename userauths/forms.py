from django import forms
from django.contrib.auth.forms import UserCreationForm

from captcha.fields import ReCaptchaField
from captcha.widgets import ReCaptchaV2Checkbox

from userauths.models import *





USER_TYPE = (
    ('Vendor', 'Vendor'),
    ('Customer', 'Customer'),

)



class UserRegisterForm(UserCreationForm):
    full_name = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control rounded', 'placeholder':'Full Name'}), required=True)
    phone = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control rounded', 'placeholder':'Phone Number'}), required=True)
    email = forms.EmailField(widget=forms.TextInput(attrs={'class':'form-control rounded', 'placeholder':'Email'}), required=True)
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control rounded', 'placeholder':'Password'}), required=True)
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control rounded', 'placeholder':'Confirm Password'}), required=True)
    captcha = ReCaptchaField(widget=ReCaptchaV2Checkbox())
    # user_type = forms.ChoiceField(choices=USER_TYPE, widget=forms.Select(attrs={'class': 'form-select'}))


    class Meta:
        model = User
        fields = ['full_name','phone',  'email', 'password1', 'password2']


class LoginForm(forms.Form):
    email = forms.EmailField(widget=forms.TextInput(attrs={'class':'form-control rounded', 'placeholder':'Email'}), required=True)
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control rounded', 'placeholder':'Password'}), required=True)
    captcha = ReCaptchaField(widget=ReCaptchaV2Checkbox())

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get('email')
        password = cleaned_data.get('password')

        if email and password:
            from django.contrib.auth import authenticate
            user = authenticate(email=email, password=password)
            if user is None or not user.is_active:
                raise forms.ValidationError('Invalid email or password.')
        return cleaned_data



