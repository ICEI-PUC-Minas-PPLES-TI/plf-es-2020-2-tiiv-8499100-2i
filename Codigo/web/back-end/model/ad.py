from services.base import Base
from sqlalchemy import Column, String, Text, Integer


class Ad(Base):
    __tablename__ = 'ad'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    text = Column(Text, nullable=False)
    img = Column(String, nullable=False)

    def __init__(self, text, img):
        self.text = text
        self.img = img

