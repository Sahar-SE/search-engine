class UpdateSearchJob < ApplicationJob
    queue_as :default

    def perform(visitor:,params:)
      
        search = visitor.searches.last
        if search.present?
          search.update!(movie_id: params) 
        end
    end
  end
  
   
  
  
  
