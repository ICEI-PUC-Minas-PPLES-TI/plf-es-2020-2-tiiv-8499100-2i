from server.app.dto.forum_dto import ForumDTO
from server.app.models.forum import Forum
from server.app.dao.dao_mysql import insert, get_all, get, update, delete


def add_forum(title):
    forum = Forum(title)
    insert(forum)


def get_all_forums():
    forums = get_all(Forum)
    return format_json(forums)


def get_forum(forum_id):
    forum = get(Forum, forum_id)
    forum = forum.__dict__
    return ForumDTO(forum['forum_id'], forum['title']).__dict__


def update_forum(forum_id, title):
    forum = Forum(title)
    update(Forum, forum_id, forum)


def delete_forum(forum_id):
    delete(Forum, forum_id)


def format_json(forums):
    forums_json = []

    for forum in forums:
        forum = forum.__dict__
        forums_json.append(ForumDTO(forum['forum_id'], forum['title']).__dict__)
    return forums_json
