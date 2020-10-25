from model.post_view import PostView
from dao.dao_mysql import get_all, insert
from dto.post_view_dto import PostViewDTO

def add_post_view(current_date, uid, viewability, post_id):
    post_view = PostView(current_date, uid, viewability, post_id)
    insert(post_view)


def get_all_post_views():
    post_views = get_all(PostView)
    return format_json(post_views)


def format_json(post_views):
    post_view_json = []

    for post_view in post_views:
        post_view = post_view.__dict__

        post_view_json.append(PostViewDTO(
            post_view['id'],
            post_view['date'].isoformat(),
            post_view['uid'],
            post_view['viewability'],
            post_view['post_id']
        ).__dict__)

    return post_view_json
