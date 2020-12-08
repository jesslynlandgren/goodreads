class BooksController < ApplicationController

	def index
		key=''
		secret=''

		response = Excon.get("https://www.goodreads.com/api/author_url/rowling?key=#{key}")
		binding.pry
		render status:200, json:{result:'ok'}
	end
end
