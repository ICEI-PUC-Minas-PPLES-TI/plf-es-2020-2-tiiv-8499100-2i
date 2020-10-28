from flask import Blueprint, request, jsonify, Response
from services import author_service

author = Blueprint('author', __name__)


@author.route("/author", methods=['POST'])
def insert():
    name = request.form['name']
    biography = request.form['biography']

    author_service.add_author(name, biography)

    return Response(status=201)


@author.route("/author", methods=['GET'])
def get_all():
    response = author_service.get_all_authors()
    return jsonify(response)


@author.route("/author/<int:id>", methods=['GET'])
def get(id):
    response = author_service.get_author(id)
    return jsonify(response)


@author.route("/author/<int:id>", methods=['PUT'])
def update(id):
    name = request.form['name']
    biography = request.form['biography']

    author_service.update_author(id, name, biography)

    return Response(status=201)


@author.route("/author/<int:id>", methods=['DELETE'])
def delete(id):
    author_service.delete_author(id)
    return Response(status=200)
