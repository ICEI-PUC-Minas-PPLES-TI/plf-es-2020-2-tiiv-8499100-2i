from dto.forum_dto import ForumDTO
from dto.forum_post_dto import ForumPostDTO
from model.forum import Forum
from dao.dao_mysql import insert, get_all, get, update, delete
from model.forum_post import ForumPost
from datetime import datetime


def add_forum(title, body, uid):
    forum = Forum(title)
    id = insert(forum)

    add_post(body, datetime.now().isoformat(), True, uid, id)


def get_all_forums():
    forums = get_all(Forum)
    return format_json(forums)


def get_forum(id):
    forum = get(Forum, id)
    forumposts_json = []
    original_post = None

    for forumpost in forum.forum_posts:
        forumpost = forumpost.__dict__

        if (forumpost['is_original_post'] == True):
            original_post = ForumPostDTO(
                forumpost['id'],
                forumpost['body'],
                forumpost['date'],
                forumpost['is_original_post']
            ).__dict__
        else:
            forumposts_json.append(
                ForumPostDTO(
                    forumpost['id'],
                    forumpost['body'],
                    forumpost['date'],
                    forumpost['is_original_post']
                ).__dict__
            )

    forum = forum.__dict__
    return ForumDTO(forum['id'], forum['title'], forumposts_json, original_post).__dict__


def update_forum(id, title):
    forum = Forum(title)
    update(Forum, id, forum)


def delete_forum(id):
    delete(Forum, id)


def add_post(body, date, is_original_post, uid, forum_id):
    forum_post = ForumPost(body, date, is_original_post, uid, forum_id)
    insert(forum_post)


def format_json(forums):
    forums_json = []

    for forum in forums:
        forumposts_json = []
        original_post = None

        for forumpost in forum.forum_posts:
            forumpost = forumpost.__dict__

            if (forumpost['is_original_post'] == True):
                original_post = ForumPostDTO(
                    forumpost['id'],
                    forumpost['body'],
                    forumpost['date'],
                    forumpost['is_original_post']
                ).__dict__
            else:
                forumposts_json.append(
                    ForumPostDTO(
                        forumpost['id'],
                        forumpost['body'],
                        forumpost['date'],
                        forumpost['is_original_post']
                    ).__dict__
                )

        forum = forum.__dict__
        forums_json.append(ForumDTO(forum['id'], forum['title'], forumposts_json, original_post).__dict__)
    return forums_json
