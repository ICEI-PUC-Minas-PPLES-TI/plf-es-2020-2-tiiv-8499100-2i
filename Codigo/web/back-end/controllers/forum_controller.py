from flask import Blueprint, request, jsonify
from services import forum_service

forum = Blueprint('forum', __name__)


@forum.route("/forum", methods=['POST'])
def insert():
    title = request.form['title']
    forum_service.add_forum(title)

    return "forum adicionado."


@forum.route("/forum", methods=['GET'])
def get_all():
    response = forum_service.get_all_forums()
    return jsonify(response)


@forum.route("/forum/<string:forum_id>", methods=['GET'])
def get(forum_id):
    response = forum_service.get_forum(forum_id)
    return jsonify(response)


@forum.route("/forum/<string:forum_id>", methods=['PUT'])
def update(forum_id):
    title = request.form['title']
    forum_service.update_forum(forum_id, title)

    return "forum atualizado."


@forum.route("/forum/<string:forum_id>", methods=['DELETE'])
def delete(forum_id):
    forum_service.delete_forum(forum_id)

    return "forum deletado"
