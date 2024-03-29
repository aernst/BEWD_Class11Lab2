class Storie < ActiveRecord::Base

	 validates :title, :link, :category, presence: true
 #    validates :description, length: { minimum: 10 }
 #    validates :year_released, numericality: {only_integer: true }
 #    validates :year_released, numericality: {greater_than: 0 }
 #    validates :rating, numericality: {greater_than: 0, less_than: 6 }
   # validates :rating, numericality: { smaller_than: 6 }

	def self.search_for(query)
		where('title LIKE :query OR category LIKE :query OR upvotes LIKE :query', query: "%#{query}%")
	end	

end
