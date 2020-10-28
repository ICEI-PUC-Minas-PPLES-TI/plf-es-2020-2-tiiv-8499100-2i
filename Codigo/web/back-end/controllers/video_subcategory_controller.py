from flask import Blueprint, request, jsonify
from services import video_subcategory_service

video_subcategory = Blueprint('video_subcategory', __name__)


@video_subcategory.route("/video_subcategory", methods=['POST'])
def insert():
    name = request.form['name']
    category_id = request.form['category_id']

    video_subcategory_service.add_video_subcategory(name, category_id)

    return "forum adicionado."


@video_subcategory.route("/video_subcategory", methods=['GET'])
def get_all():
    response = video_subcategory_service.get_all_video_subcategories()
    return jsonify(response)


@video_subcategory.route("/video_subcategory/category/<int:id>", methods=['GET'])
def get_category(id):
    response = video_subcategory_service.get_all_video_subcategories()
    formatted_categories = []
    for c in response:
        if (c['category'] == id):
            formatted_categories.append(c)

    return jsonify(formatted_categories)


@video_subcategory.route("/video_subcategory/<int:id>", methods=['GET'])
def get(id):
    response = video_subcategory_service.get_video_subcategory(id)
    return jsonify(response)


@video_subcategory.route("/video_subcategory/<int:id>", methods=['PUT'])
def update(id):
    name = request.form['name']
    category_id = request.form['category_id']

    video_subcategory_service.update_video_subcategory(id, name, category_id)

    return "forum atualizado."


@video_subcategory.route("/video_subcategory/<int:id>", methods=['DELETE'])
def delete(id):
    video_subcategory_service.delete_video_subcategory(id)
    return "forum deletado"
