import datetime
from flask import Blueprint, request, jsonify
from services import post_service

post = Blueprint('post', __name__)


@post.route("/post", methods=['POST'])
def insert():
    title = request.form['title']
    body = request.form['body']
    img = request.form['img']
    date = datetime.datetime.now().isoformat()
    author_id = request.form['author_id']
    requires_login = request.form['requires_login'] == 'true'

    post_service.add_post(title, body, date, img, requires_login, author_id)

    return "forum adicionado."


@post.route("/post", methods=['GET'])
def get_all():
    response = post_service.get_all_posts()
    return jsonify(response)


@post.route("/post/<int:id>", methods=['GET'])
def get(id):
    response = post_service.get_post(id)
    return jsonify(response)


@post.route("/post/<int:id>", methods=['PUT'])
def update(id):
    title = request.form['title']
    body = request.form['body']
    img = request.files.get('img')
    date = datetime.datetime.now().isoformat()
    author_id = request.form['author_id']
    requires_login = request.form['requires_login']

    post_service.update_post(id, title, body, date, img, requires_login, author_id)

    return "forum atualizado."


@post.route("/post/<int:id>", methods=['DELETE'])
def delete(id):
    post_service.delete_post(id)
    return "forum deletado"
