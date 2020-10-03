from sqlalchemy import Column, String, Integer
from services.base import Base


class Forum(Base):
    __tablename__ = 'forum'

    forum_id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    title = Column(String)

    def __init__(self, title):
        self.title = title
