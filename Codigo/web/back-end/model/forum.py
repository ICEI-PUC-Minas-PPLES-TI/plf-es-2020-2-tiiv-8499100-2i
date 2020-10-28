from services.base import Base
from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import relationship


class Forum(Base):
    __tablename__ = 'forum'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    title = Column(String, nullable=False)
    forum_posts = relationship("ForumPost")

    def __init__(self, title):
        self.title = title
