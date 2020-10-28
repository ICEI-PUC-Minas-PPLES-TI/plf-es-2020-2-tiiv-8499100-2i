from flask import Blueprint, request, jsonify
from services import symbol_subcategory_service

symbol_subcategory = Blueprint('symbol_subcategory', __name__)


@symbol_subcategory.route("/symbol_subcategory", methods=['POST'])
def insert():
    name = request.form['name']
    category_id = request.form['category_id']

    symbol_subcategory_service.add_symbol_subcategory(name, category_id)

    return "forum adicionado."


@symbol_subcategory.route("/symbol_subcategory", methods=['GET'])
def get_all():
    response = symbol_subcategory_service.get_all_symbol_subcategories()
    return jsonify(response)


@symbol_subcategory.route("/symbol_subcategory/category/<int:id>", methods=['GET'])
def get_category(id):
    response = symbol_subcategory_service.get_all_symbol_subcategories()
    formatted_categories = []
    for c in response:
        if (c['category'] == id):
            formatted_categories.append(c)

    return jsonify(formatted_categories)


@symbol_subcategory.route("/symbol_subcategory/<int:id>", methods=['GET'])
def get(id):
    response = symbol_subcategory_service.get_symbol_subcategory(id)
    return jsonify(response)


@symbol_subcategory.route("/symbol_subcategory/<int:id>", methods=['PUT'])
def update(id):
    name = request.form['name']
    category_id = request.form['category_id']

    symbol_subcategory_service.update_symbol_subcategory(id, name, category_id)

    return "forum atualizado."


@symbol_subcategory.route("/symbol_subcategory/<int:id>", methods=['DELETE'])
def delete(id):
    symbol_subcategory_service.delete_symbol_subcategory(id)
    return "forum deletado"
