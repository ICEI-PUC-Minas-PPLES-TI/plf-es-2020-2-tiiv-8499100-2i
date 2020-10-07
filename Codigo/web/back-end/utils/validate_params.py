from datetime import datetime

from enums.error.params_error import ParamsError
from utils.exceptions import ExceptionUtils, ValidationException


def validate_text_param(param):
    if len(param) < 3 or param is None:
        raise ExceptionUtils.handle_param_exception(ValidationException(ParamsError.INVALID_VALUE.value.format(
            'Text value must be greater than 3 characters')))


def validate_date_param(param):
    if param.date() < datetime.now().date():
        raise ExceptionUtils.handle_param_exception(ValidationException(ParamsError.INVALID_VALUE.value.format(
            'Date value must be equal or greater than the current date')))


def validate_boolean_param(param):
    if not type(param) is bool:
        raise ExceptionUtils.handle_param_exception(ValidationException(ParamsError.INVALID_TYPE.value.format(
            'Boolean type expected', bool)))


def validate_none_value(param):
    if not type(param) is bool:
        raise ExceptionUtils.handle_param_exception(ValidationException(ParamsError.INVALID_TYPE.value.format(
            'The requires_login field must be boolean', bool)))