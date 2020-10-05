from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql://root:Alienigenas1234@localhost:3306/2i')
Session = sessionmaker(bind=engine)

Base = declarative_base()
Base.metadata.create_all(engine)
