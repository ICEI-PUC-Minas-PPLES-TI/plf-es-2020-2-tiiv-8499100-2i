class AuthorDTO:

    def __init__(self, id, name, biography):
        self.id = id
        self.name = name
        self.biography = biography

    def get_id(self):
        return self.id

    def set_id(self, id):
        self.id = id

    def get_name(self):
        return self.name

    def set_name(self, name):
        self.name = name

    def get_biography(self):
        return self.biography

    def set_biography(self, biography):
        self.biography = biography
