from datetime import datetime
from dto.post_dto import PostDTO
from dto.author_dto import AuthorDTO
from enums.error.params_error import ParamsError
from model.post import Post
from dao.dao_mysql import insert, get_all, get, update, delete
from utils.exceptions import ExceptionUtils, ValidationException
from utils.validate_params import validate_text_param, validate_date_param, validate_boolean_param


def add_post(title, body, publish_date, img, requires_login, author_id):
    date = datetime.now()

    if publish_date is None:
        publish_date = date
    else:
        publish_date = __parse_date(publish_date)

    requires_login = __parse_bool(requires_login.lower())
    __validate_params(title, body, publish_date, requires_login)

    post = Post(title, body, date, publish_date, img, requires_login, author_id)
    insert(post)


def get_all_posts():
    posts = get_all(Post)
    return format_json(posts)


def get_post(id):
    post = get(Post, id)
    author = AuthorDTO(post.author.id, post.author.name, post.author.biography).__dict__
    post = post.__dict__
    return PostDTO(post['id'], post['title'], post['body'], post['date'], post['img'], post['requires_login'], author).__dict__


def update_post(id, title, body, date, publish_date, img, requires_login, author_id):

    if publish_date is None:
        publish_date = date
    else:
        publish_date = __parse_date(publish_date)

    requires_login = __parse_bool(requires_login.lower())
    __validate_params(title, body, publish_date, requires_login)

    post = Post(title, body, date, publish_date, img, requires_login, author_id)
    update(Post, id, post)


def delete_post(id):
    delete(Post, id)


def format_json(posts):
    posts_json = []

    for post in posts:
        author = AuthorDTO(post.author.id, post.author.name, post.author.biography).__dict__
        print(author)
        post = post.__dict__
        posts_json.append(
            PostDTO(
                post['id'],
                post['title'],
                post['body'],
                post['date'],
                post['img'],
                post['requires_login'],
                author
            ).__dict__
        )
    return posts_json


def __validate_params(title, body, publish_date, requires_login):
    validate_text_param(title)
    validate_text_param(body)
    validate_date_param(publish_date)
    validate_boolean_param(requires_login)


def __parse_bool(string):
    d = {'true': True, 'false': False}
    return d.get(string, string)


def __parse_date(date_str):
    if date_str is None:
        return None
    try:
        return datetime.strptime(date_str, "%d/%m/%Y %H:%M:%S")
    except ValueError as error:
        raise ExceptionUtils.handle_param_exception(ValidationException(ParamsError.INVALID_VALUE.value.format(
            'Could not parse date: ' + str(error))))
    except TypeError as error:
        raise ExceptionUtils.handle_param_exception(ValidationException(ParamsError.INVALID_TYPE.value.format(
            'Could not parse date: ' + str(error))))