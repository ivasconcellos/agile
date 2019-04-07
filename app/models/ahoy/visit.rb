class Ahoy::Visit < ApplicationRecord

  	include Ahoy::QueryMethods
  	
  	self.table_name = "ahoy_visits"
  	has_many :events, class_name: "Ahoy::Event"
	belongs_to :usuario, optional: true
end
