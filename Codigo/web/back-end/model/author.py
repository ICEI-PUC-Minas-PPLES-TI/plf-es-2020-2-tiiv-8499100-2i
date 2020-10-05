from services.base import Base
from sqlalchemy import Column, String, Text, Integer


class Author(Base):
    __tablename__ = 'author'

    id = Column(Integer, primary_key=True, unique=True, autoincrement=True)
    name = Column(String, nullable=False)
    biography = Column(Text, nullable=False)

    def __init__(self, name, biography):
        self.name = name
        self.biography = biography

