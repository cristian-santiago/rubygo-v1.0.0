class Blog < ApplicationRecord
    
    

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
    
    belongs_to :category    
        
    has_many_attached  :image
    belongs_to :user

    
    


    def should_generate_new_friendly_id?
    title_changed?
    end

   


   

end
