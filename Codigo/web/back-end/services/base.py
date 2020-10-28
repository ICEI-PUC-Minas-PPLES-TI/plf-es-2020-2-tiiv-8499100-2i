import os
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

host = os.environ['HOST']
port = os.environ['PORT']
username = os.environ['USERNAME']
password = os.environ['PASSWORD']
database = os.environ['DATABASE']

engine = create_engine(f'mysql://{username}:{password}@{host}:{port}/{database}')
Session = sessionmaker(bind=engine)

Base = declarative_base()
Base.metadata.create_all(engine)
