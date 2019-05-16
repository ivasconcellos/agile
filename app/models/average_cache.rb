class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Usuario"
  belongs_to :rateable, :polymorphic => true
end
