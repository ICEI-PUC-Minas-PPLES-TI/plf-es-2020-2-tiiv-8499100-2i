from dto.author_dto import AuthorDTO
from model.author import Author
from dao.dao_mysql import insert, get_all, get, update, delete


def add_author(name, biography):
    author = Author(name, biography)
    insert(author)


def get_all_authors():
    authors = get_all(Author)
    return format_json(authors)


def get_author(id):
    author = get(Author, id)
    author = author.__dict__
    return AuthorDTO(author['id'], author['name'], author['biography']).__dict__


def update_author(id, name, biography):
    author = Author(name, biography)
    update(Author, id, author)


def delete_author(id):
    delete(Author, id)


def format_json(authors):
    authors_json = []

    for author in authors:
        author = author.__dict__
        authors_json.append(AuthorDTO(author['id'], author['name'], author['biography']).__dict__)
    return authors_json
