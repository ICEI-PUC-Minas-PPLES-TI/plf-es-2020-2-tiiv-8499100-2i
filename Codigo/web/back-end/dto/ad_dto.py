class AdDTO:

    def __init__(self, id, text):
        self.id = id
        self.text = text

    def get_id(self):
        return self.id

    def set_id(self, id):
        self.id = id

    def get_text(self):
        return self.text

    def set_text(self, text):
        self.text = text
