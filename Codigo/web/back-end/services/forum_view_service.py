from model.forum_view import ForumView
from dao.dao_mysql import get_all, insert
from dto.forum_view_dto import ForumViewDTO


def add_forum_view(current_date, uid, forum_id):
    forum_view = ForumView(current_date, uid, forum_id)
    insert(forum_view)


def get_all_forum_views():
    forum_views = get_all(ForumView)
    return format_json(forum_views)


def format_json(forum_views):
    forum_view_json = []

    for forum_view in forum_views:
        forum_view = forum_view.__dict__

        forum_view_json.append(ForumViewDTO(
            forum_view['id'],
            forum_view['date'].isoformat(),
            forum_view['uid'],
            forum_view['forum_id']
        ).__dict__)

    return forum_view_json
