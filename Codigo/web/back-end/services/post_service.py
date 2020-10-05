from dto.post_dto import PostDTO
from dto.author_dto import AuthorDTO
from model.post import Post
from dao.dao_mysql import insert, get_all, get, update, delete


def add_post(title, body, date, img, requires_login, author_id):
    post = Post(title, body, date, img, requires_login, author_id)
    insert(post)


def get_all_posts():
    posts = get_all(Post)
    return format_json(posts)


def get_post(id):
    post = get(Post, id)
    author = AuthorDTO(post.author.id, post.author.name, post.author.biography).__dict__
    post = post.__dict__
    return PostDTO(post['id'], post['title'], post['body'], post['date'], post['img'], post['requires_login'], author).__dict__


def update_post(id, title, body, date, img, requires_login, author_id):
    post = Post(title, body, date, img, requires_login, author_id)
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
