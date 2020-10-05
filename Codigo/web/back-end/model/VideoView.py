from model.View import View
from dao.genericDao import GenericDao
from model.EnumClass import EnumClass

video_view_dao = GenericDao()


class VideoView(View):

    def __init__(self, date, user_id, video_id):
        super().__init__(date, user_id)
        self.video_id = video_id

    def insert(self, video_view):
        video_view_dao.insert(video_view.__dict__, EnumClass.VIDEO_VIEW.value)
