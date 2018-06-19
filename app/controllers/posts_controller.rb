class PostsController < ApplicationController
	def index
		@posts= Post.all
	end 
   
   # instace variables are accesible inside the views. 
   # params grabs the id from the url.
	def show 
		@post= Post.find(params[:id])
	end 

	def new
		# empty post object is required 
		# We have the access to this empty object in view.
		@post = Post.new
	end 
       
       #  Form is submitted to this action 
	def create 
       @post = Post.new(post_params)
       if @post.save
       	 redirect_to posts_path , :notice => "Your post was saved"
       	else
       		render "new"
       end
	end

end


# def create
#   @article = Article.new(article_params)
 
#   @article.save
#   redirect_to @article
# end
 
private
  def post_params
    params.require(:post).permit(:title, :content)
  end