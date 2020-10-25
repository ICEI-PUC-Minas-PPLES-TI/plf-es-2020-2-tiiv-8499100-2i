from datetime import date
from flask import Blueprint, request, jsonify, Response
from services import calculator_view_service

calculator_view = Blueprint('calculator_view', __name__)


@calculator_view.route("/calculator_view", methods=['POST'])
def insert():
    data = request.form
    current_date = date.today().strftime("%Y-%m-%d")
    user_id = data["uid"]
    calculator_type = data["calculator_type"]

    calculator_view_service.add_calculator_view(current_date, user_id, calculator_type)

    return Response(status=201)


@calculator_view.route("/calculator_view", methods=['GET'])
def get_all():
    response = calculator_view_service.get_all_calculator_views()
    return jsonify(response)

