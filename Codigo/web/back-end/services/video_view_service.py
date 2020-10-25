from model.video_view import VideoView
from dao.dao_mysql import get_all, insert
from dto.video_view_dto import VideoViewDTO


def add_video_view(current_date, uid, video_id):
    video_view = VideoView(current_date, uid, video_id)
    insert(video_view)

def get_all_video_views():
    symbol_views = get_all(VideoView)
    return format_json(symbol_views)


def format_json(video_views):
    video_view_json = []

    for video_view in video_views:
        video_view = video_view.__dict__

        video_view_json.append(VideoViewDTO(
            video_view['id'],
            video_view['date'].isoformat(),
            video_view['uid'],
            video_view['video_id']
        ).__dict__)

    return video_view_json
