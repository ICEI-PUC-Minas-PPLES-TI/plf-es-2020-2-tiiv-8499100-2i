import json
import os

import pyrebase


def setCredential():
    with open(os.environ.get('PATH_CREDENTIALS')) as source:
        info = json.load(source)

    return pyrebase.initialize_app(info)


def signUp(email, password):
    firebase = setCredential()
    auth = firebase.auth()
    return auth.create_user_with_email_and_password(email, password)


def login(email, password):
    firebase = setCredential()
    auth = firebase.auth()
    login_token = auth.sign_in_with_email_and_password(email, password)

    return login_token


def resetPassword(self, email):
    firebase = self.setCredential()
    auth = firebase.auth()
    password_reset = auth.send_password_reset_email(email)
