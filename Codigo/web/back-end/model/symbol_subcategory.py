from services.base import Base
from sqlalchemy import Column, String, Integer


class SymbolSubcategory(Base):
    __tablename__ = 'symbol_subcategory'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    name = Column(String, nullable=False)
    category_id = Column(Integer, nullable=False)

    def __init__(self, name, category_id):
        self.name = name
        self.category_id = category_id
