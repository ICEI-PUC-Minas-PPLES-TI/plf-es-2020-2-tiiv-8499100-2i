from flask import Blueprint, request, jsonify
from services import video_category_service

video_category = Blueprint('video_category', __name__)


@video_category.route("/video_category", methods=['POST'])
def insert():
    name = request.form['name']

    video_category_service.add_video_category(name)

    return "forum adicionado."


@video_category.route("/video_category", methods=['GET'])
def get_all():
    response = video_category_service.get_all_video_categories()
    return jsonify(response)


@video_category.route("/video_category/<int:id>", methods=['GET'])
def get(id):
    response = video_category_service.get_video_category(id)
    return jsonify(response)


@video_category.route("/video_category/<int:id>", methods=['PUT'])
def update(id):
    name = request.form['name']

    video_category_service.update_video_category(id, name)

    return "forum atualizado."


@video_category.route("/video_category/<int:id>", methods=['DELETE'])
def delete(id):
    video_category_service.delete_video_category(id)
    return "forum deletado"
