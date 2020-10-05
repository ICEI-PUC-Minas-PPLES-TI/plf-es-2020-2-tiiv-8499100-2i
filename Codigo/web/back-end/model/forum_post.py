from sqlalchemy import Column, String, Integer, Boolean, Date, ForeignKey
from services.base import Base


class ForumPost(Base):
    __tablename__ = 'forum_post'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    body = Column(String, nullable=False)
    date = Column(Date, nullable=False)
    is_original_post = Column(Boolean, nullable=False)
    uid = Column(String, nullable=False)
    forum_id = Column(Integer, ForeignKey('forum.id'))

    def __init__(self, body, date, is_original_post, uid, forum_id):
        self.body = body
        self.date = date
        self.is_original_post = is_original_post
        self.uid = uid
        self.forum_id = forum_id
