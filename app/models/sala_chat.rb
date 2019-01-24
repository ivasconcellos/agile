class SalaChat < ApplicationRecord
	has_many :mensagens, dependent: :destroy
	belongs_to :usuario
end
