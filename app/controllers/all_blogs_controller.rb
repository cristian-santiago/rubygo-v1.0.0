class AllBlogsController < ApplicationController
  #before_action :authenticate_user!
  def index
    @users = User.all
    
    @categories = Category.all
    cate = params[:cate]
    
    if !cate.nil?
      @blogs = Blog.where(:category_id => cate)
     
    else
      @blogs = Blog.all

    end
    
          
    @blogs = Blog.search(params[:search])
         
  end


  private


  def blog_params
    params.require(:blog).permit(:title, :description, :content, :category_id, :user_id, :search)
    
  end



  
end
