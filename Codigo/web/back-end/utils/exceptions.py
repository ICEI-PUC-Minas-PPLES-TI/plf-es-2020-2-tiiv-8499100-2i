from flask import jsonify, abort, make_response


class ParsingException(Exception):
    pass


class ValidationException(Exception):
    pass


class NoneException(Exception):
    pass


class ExceptionUtils:
    @staticmethod
    def handle_none_value(exception):
        ExceptionUtils.handle_exception(500, exception)

    @staticmethod
    def handle_param_exception(exception):
        ExceptionUtils.handle_exception(400, exception)

    @staticmethod
    def handle_exception(code, exception):
        msg = type(exception).__name__ + " - " + str(exception)
        abort(make_response(jsonify(message=msg), code))
