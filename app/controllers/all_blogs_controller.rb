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

    if params[:search]
      blog_search
    end
    
          
    #@blogs = Blog.search(params[:search])
         
  end

  def blog_search
    #if @parameter != @blogs
    if params[:search].blank?
        respond_to do |format|

        format.html { redirect_to all_blogs_path, alert: "Result not found" }
      end
      
    else
      @parameter = params[:search].downcase
      @blogs = Blog.where("lower(title) LIKE :search", search: "%#{@parameter}%")
      @blogs = Blog.where("lower(description) LIKE :search", search: "%#{@parameter}%")
      @blogs = Blog.where("lower(content) LIKE :search", search: "%#{@parameter}%")
    
      

  # if @blogs = Blog.where("title LIKE ?", "%#{params[:search]}%")
    
      #b = Blog

     #self.where(id: blog)
     #redirect_to @blogs
   # else
     # respond_to do |format|

      #  format.html { redirect_to all_blogs_path, alert: "Result not found" }
    #  end
    end
  end



  private

  




  def blog_params
    params.require(:blog).permit(:title, :description, :content, :category_id, :user_id, :search)
    
  end



  
end
