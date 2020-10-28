from dto.video_dto import VideoDTO
from model.video import Video
from dao.dao_mysql import insert, get_all, get, update, delete


def add_video(title, youtube_url, date, subcategory_id):
    video = Video(title, youtube_url, date, subcategory_id)
    insert(video)


def get_all_videos():
    videos = get_all(Video)
    return format_json(videos)


def get_video(id):
    video = get(Video, id)
    video = video.__dict__
    return VideoDTO(video['id'], video['title'], video['date'].isoformat(), video['youtube_url'], video['subcategory_id']).__dict__


def update_video(id, title, youtube_url, subcategory_id):
    video = Video(title, youtube_url, subcategory_id)
    update(Video, id, video)


def delete_video(id):
    delete(Video, id)


def format_json(videos):
    videos_json = []

    for video in videos:
        video = video.__dict__
        videos_json.append(VideoDTO(video['id'], video['title'], video['date'].isoformat(), video['youtube_url'], video['subcategory_id']).__dict__)
    return videos_json
