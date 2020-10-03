from sqlalchemy import Column, String, Integer, Boolean, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from services.base import Base


class ForumPost(Base):
    __tablename__ = 'forum_post'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    body = Column(String)
    date = Column(DateTime)
    is_original_post = Column(Boolean)
    uid = Column(String)
    forum_id = Column(Integer)

    # , ForeignKey('forum.id')
    # , ForeignKey('user.uid')
    # user = relationship("User")
    # forum = relationship("Forum")

    def __init__(self, body, date, is_original_post, uid, forum_id):
        self.body = body
        self.date = date
        self.is_original_post = is_original_post
        self.uid = uid
        self.forum_id = forum_id
