class Repo < ApplicationRecord
 
   validates_presence_of :name

   has_many :events, dependent: :destroy

   def as_json
      {
      	id: self.id,
      	name: self.name
      }
   end

end
