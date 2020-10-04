class VideoDTO:
	def __init__(self, id, youtubeUrl, title, subcategory):
		self.id = id
		self.youtubeUrl = youtubeUrl
		self.title = title
		self.subcategory = subcategory

	def get_id(self):
		return self.id

	def set_id(self, id):
		self.id = id

	def get_youtubeUrl(self):
		return self.youtubeUrl

	def set_youtubeUrl(self, youtubeUrl):
		self.youtubeUrl = youtubeUrl

	def get_title(self):
		return self.title

	def set_title(self, title):
		self.title = title

	def get_subcategory(self):
		return self.subcategory

	def set_subcategory(self, subcategory):
		self.subcategory = subcategory