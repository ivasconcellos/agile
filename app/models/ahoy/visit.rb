class Ahoy::Visit < ApplicationRecord
  include Ahoy::QueryMethods
  
  self.table_name = "ahoy_visits"

  belongs_to :usuario, optional: true
end
