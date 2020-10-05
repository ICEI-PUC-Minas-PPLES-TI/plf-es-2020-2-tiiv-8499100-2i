from services.base import Base
from sqlalchemy import Column, String, Boolean, Date, Text, Integer, ForeignKey
from sqlalchemy.orm import relationship


class Post(Base):
    __tablename__ = 'post'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    title = Column(String, nullable=False)
    body = Column(Text, nullable=False)
    date = Column(Date, nullable=False)
    img = Column(String, nullable=False)
    requires_login = Column(Boolean, nullable=False)
    author_id = Column(Integer, ForeignKey('author.id'))
    author = relationship('Author')

    def __init__(self, title, body, date, img, requires_login, author_id):
        self.title = title
        self.body = body
        self.date = date
        self.img = img
        self.requires_login = requires_login
        self.author_id = author_id

