from flask import Blueprint, request, jsonify
from services import symbol_category_service

symbol_category = Blueprint('symbol_category', __name__)


@symbol_category.route("/symbol_category", methods=['POST'])
def insert():
    name = request.form['name']

    symbol_category_service.add_symbol_category(name)

    return "forum adicionado."


@symbol_category.route("/symbol_category", methods=['GET'])
def get_all():
    response = symbol_category_service.get_all_symbol_categories()
    return jsonify(response)


@symbol_category.route("/symbol_category/<int:id>", methods=['GET'])
def get(id):
    response = symbol_category_service.get_symbol_category(id)
    return jsonify(response)


@symbol_category.route("/symbol_category/<int:id>", methods=['PUT'])
def update(id):
    name = request.form['name']

    symbol_category_service.update_symbol_category(id, name)

    return "forum atualizado."


@symbol_category.route("/symbol_category/<int:id>", methods=['DELETE'])
def delete(id):
    symbol_category_service.delete_symbol_category(id)
    return "forum deletado"
