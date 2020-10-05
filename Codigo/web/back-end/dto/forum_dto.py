class ForumDTO:

    def __init__(self, id, title, forumPosts, originalPost):
        self.id = id
        self.title = title
        self.forumPosts = forumPosts
        self.originalPost = originalPost

    def get_id(self):
        return self.id

    def set_id(self, id):
        self.id = id

    def get_title(self):
        return self.title

    def set_title(self, title):
        self.title = title
