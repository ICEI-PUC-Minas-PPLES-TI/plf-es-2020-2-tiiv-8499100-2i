from services.base import Base
from sqlalchemy import Column, DateTime, Integer, Float, ForeignKey
from sqlalchemy.orm import relationship

class PostView(Base):
    __tablename__ = 'post_view'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    date = Column(DateTime, nullable=False)
    uid = Column(Integer, ForeignKey('user.uid'))
    viewability = Column(Float, nullable=False)
    post_id = Column(Integer, ForeignKey('post.id'))

    user = relationship('User')
    post = relationship('Post')

    def __init__(self, date, uid, viewability, post_id):
        self.date = date
        self.uid = uid
        self.viewability = viewability
        self.post_id = post_id

