from services.base import Base
from sqlalchemy import Column, String, Integer, Date, ForeignKey


class Video(Base):
    __tablename__ = 'video'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    title = Column(String, nullable=False)
    youtube_url = Column(String, nullable=False)
    date = Column(Date, nullable=False)
    subcategory_id = Column(Integer, ForeignKey('video_subcategory.id'))

    def __init__(self, title, youtube_url, date, subcategory_id):
        self.title = title
        self.youtube_url = youtube_url
        self.date = date
        self.subcategory_id = subcategory_id

