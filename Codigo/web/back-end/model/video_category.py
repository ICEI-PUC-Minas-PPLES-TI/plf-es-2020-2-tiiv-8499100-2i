from services.base import Base
from sqlalchemy import Column, String, Integer


class VideoCategory(Base):
    __tablename__ = 'video_category'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    name = Column(String, nullable=False)

    def __init__(self, name):
        self.name = name
