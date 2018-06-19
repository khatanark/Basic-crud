class PostsController < ApplicationController
	def index
		@posts= Post.all
	end 
   
   # instace variables are accesible inside the views. 
   # params grabs the id from the url.
	def show 
		@post= Post.find(params[:id])
	end 
end
