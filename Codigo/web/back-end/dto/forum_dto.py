class ForumDTO:

    def __init__(self, id, title):
        self.id = id
        self.title = title

    def get_id(self):
        return self.id

    def set_id(self, id):
        self.id = id

    def get_title(self):
        return self.title

    def set_title(self, title):
        self.title = title
