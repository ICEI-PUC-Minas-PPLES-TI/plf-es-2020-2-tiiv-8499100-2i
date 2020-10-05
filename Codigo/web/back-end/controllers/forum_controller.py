import datetime
from flask import Blueprint, request, jsonify
from services import forum_service

forum = Blueprint('forum', __name__)


@forum.route("/forum", methods=['POST'])
def insert():
    title = request.form['title']
    body = request.form['body']
    uid = request.form['uid']

    forum_service.add_forum(title, body, uid)

    return "forum adicionado."


@forum.route("/forum", methods=['GET'])
def get_all():
    response = forum_service.get_all_forums()
    return jsonify(response)


@forum.route("/forum/<int:id>", methods=['GET'])
def get(id):
    response = forum_service.get_forum(id)
    return jsonify(response)


@forum.route("/forum/<int:id>", methods=['PUT'])
def update(id):
    title = request.form['title']
    forum_service.update_forum(id, title)

    return "forum atualizado."


@forum.route("/forum/<int:id>", methods=['DELETE'])
def delete(id):
    forum_service.delete_forum(id)
    return "forum deletado"


@forum.route("/forum/<int:forum_id>/add_response", methods=['POST'])
def insert_post(forum_id):
    body = request.form['body']
    uid = request.form['uid']
    date = datetime.datetime.now().isoformat()
    is_original_post = False

    forum_service.add_post(body, date, is_original_post, uid, forum_id)
    return "forum adicionado."


@forum.route("/forum/<int:forum_id>/<int:post_id>", methods=['DELETE'])
def delete_post():
    return "forum adicionado."