class BlogsController < ApplicationController
  
  def index
    
    @categories = Category.all
    
    cate = params[:cate]
    
    if !cate.nil?
      @blogs = Blog.where(:category_id => cate)
    else

      redirect_to root_path
    end
  
      
  end

  def show    
    #@user = User.find(params[:id])
    @blog = Blog.find(params[:id])
    if @blog.nil?
      redirect_to :action => :index
    end    
    
  end
  
  
  def new
    @blog = Blog.new
  end
  

  def create
    #@users = User.all
    @blog = current_user.blogs.create!(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render :new
   end
  end

  def edit
    @blog = Blog.find(params[:id])

    if user_signed_in?
    
    else
      redirect_to root_path
    end
  end

 
  def update
    
    @blog = Blog.find(params[:id])
    
    if user_signed_in?
      @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy 
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to :action => :index, status: 303
  
    

  end
  private


  def blog_params
    params.require(:blog).permit(:title, :description, :content, :category_id, :user_id, )
    
  end
end
