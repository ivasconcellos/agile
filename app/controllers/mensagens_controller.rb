class MensagensController < ApplicationController
	before_action :authenticate_usuario!
end
