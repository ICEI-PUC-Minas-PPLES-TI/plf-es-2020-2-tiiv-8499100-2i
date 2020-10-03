from dto.forum_dto import ForumDTO
from models.forum import Forum
from dao.dao_mysql import insert, get_all, get, update, delete
from models.forum_post import ForumPost
from datetime import datetime


def add_forum(title, body, uid):
    forum = Forum(title)
    insert(forum)
    forum_id = 1
    add_post(body, datetime.now.ISO_FORMAT, True, uid, forum_id)


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


def add_post(body, date, is_original_post, uid, forum_id):
    forum_post = ForumPost(body, date, is_original_post, uid, forum_id)
    insert(forum_post)


def format_json(forums):
    forums_json = []

    for forum in forums:
        forum = forum.__dict__
        forums_json.append(ForumDTO(forum['forum_id'], forum['title']).__dict__)
    return forums_json
