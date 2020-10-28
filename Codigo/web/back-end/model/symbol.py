from services.base import Base
from sqlalchemy import Column, String, Text, Integer, ForeignKey


class Symbol(Base):
    __tablename__ = 'symbol'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    title = Column(String, nullable=False)
    body = Column(Text, nullable=False)
    img = Column(String, nullable=False)
    subcategory_id = Column(Integer, ForeignKey('symbol_subcategory.id'))

    def __init__(self, title, body, img, subcategory_id):
        self.title = title
        self.body = body
        self.img = img
        self.subcategory_id = subcategory_id
