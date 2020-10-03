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


@forum.route("/forum/<int:forum_id>", methods=['GET'])
def get(forum_id):
    response = forum_service.get_forum(forum_id)
    return jsonify(response)


@forum.route("/forum/<int:forum_id>", methods=['PUT'])
def update(forum_id):
    title = request.form['title']
    forum_service.update_forum(forum_id, title)

    return "forum atualizado."


@forum.route("/forum/<int:forum_id>", methods=['DELETE'])
def delete(forum_id):
    forum_service.delete_forum(forum_id)
    return "forum deletado"


@forum.route("/forum/<int:forum_id>", methods=['POST'])
def insert_post():
    body = request.form['body']
    date = request.form['date']
    is_original_post = False
    uid = request.form['uid']
    forum_id = request.form['forum_id']

    forum_service.add_post(body, date, is_original_post, uid, forum_id)
    return "forum adicionado."


@forum.route("/forum/<int:forum_id>/<int:id>", methods=['DELETE'])
def delete_post():
    return "forum adicionado."