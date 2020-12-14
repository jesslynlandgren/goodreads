class BooksController < ApplicationController

	def index


		response = Excon.get("https://www.goodreads.com/api/author_url/cagin?key=#{key}")
		author_id = Hash.from_xml(response.body)["GoodreadsResponse"]["author"]["id"]
		# if Author.where(goodreads_id:author_id) 
		# 	author = Author.where(goodreads_id:author_id).first
		# else
		# 	author_response = Excon.get("https://www.goodreads.com/author/show.xml?key=#{key}&id=#{author_id}")
		# 	author_info = Hash.from_xml(author_response.body).with_indifferent_access[:GoodreadsResponse][:author]
		# 	author = Author.create(goodreads_id:author_info[:id], name:author_info[:name], about:author_info[:about], image_url:author_info[:image_url])
		# end

		# TODO: Talk about memoization
		author_response = Excon.get("https://www.goodreads.com/author/show.xml?key=#{key}&id=#{author_id}")
		author_info = Hash.from_xml(author_response.body).with_indifferent_access[:GoodreadsResponse][:author]
		author = Author.where(:goodreads_id => author_id).first_or_create(goodreads_id:author_info[:id], name:author_info[:name], about:author_info[:about], image_url:author_info[:image_url])
		
		# binding.pry
		render status:200, json:author
	end
end
