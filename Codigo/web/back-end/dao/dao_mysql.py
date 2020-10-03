from services.base import Session


def insert(data):
    session = start_session()
    session.add(data)
    close_session(session)


def get_all(type_class):
    session = start_session()
    data = session.query(type_class).all()
    # close_session(session)
    return data


def get(type_class, id):
    session = start_session()
    data = session.query(type_class).get(id)
    # close_session(session)
    return data


def update(type_class, id, data):
    session = start_session()
    data = session.query(type_class).filter(id).update()
    session.add(data)
    close_session(session)


def delete(type_class, id):
    session = start_session()
    session.query(type_class).filter(type_class.forum_id == id).delete()
    close_session(session)


def start_session():
    # Create a new session
    return Session()


def close_session(session):
    session.commit()
    session.close()
