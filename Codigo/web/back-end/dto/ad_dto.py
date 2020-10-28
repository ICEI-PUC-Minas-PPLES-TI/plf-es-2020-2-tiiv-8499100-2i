class AdDTO:

    def __init__(self, id, text, img):
        self.id = id
        self.text = text
        self.img = img

    def get_id(self):
        return self.id

    def set_id(self, id):
        self.id = id

    def get_text(self):
        return self.text

    def set_text(self, text):
        self.text = text

    def get_img(self):
        return self.img

    def set_img(self, img):
        self.img = img