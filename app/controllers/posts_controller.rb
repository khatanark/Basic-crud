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

     # http://localhost:3000/posts/1/edit
     #  this id is grab from the url.
	def edit
       @post =Post.find(params[:id])
	end


	def update
		@post =Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to posts_path, :notice => "Your post has been updated"
		else 
			render "edit"
	end
   end 

   def destroy 
   	@post =Post.find(params[:id])
    @post.destroy
    redirect_to posts_path , :notice => "Your message is deleted"
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