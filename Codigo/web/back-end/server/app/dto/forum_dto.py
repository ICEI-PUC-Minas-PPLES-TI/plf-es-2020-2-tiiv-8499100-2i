class ForumDTO:

    def __init__(self, forumId, title):
        self.forumId = forumId
        self.title = title

    def get_post_id(self):
        return self.forumId

    def set_post_id(self, forumId):
        self.forumId = forumId

    def get_title(self):
        return self.title

    def set_title(self, title):
        self.title = title
