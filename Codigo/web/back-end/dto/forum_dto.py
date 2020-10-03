class ForumDTO:

    def __init__(self, id, title):
        self.id = id
        self.title = title

    def get_post_id(self):
        return self.forumId

    def set_post_id(self, id):
        self.id = id

    def get_title(self):
        return self.title

    def set_title(self, title):
        self.title = title
