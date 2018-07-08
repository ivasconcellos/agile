Rails.application.routes.draw do

  resources :cursos
  resources :tema_cursos
  devise_for :admins
  devise_for :usuarios



  devise_scope :usuario do
    root 'devise/sessions#new'
  end
  # root  :to =>'controle/#inicial'
  

  get 'inicial' => 'controle#inicial'
  get 'sobre' => 'controle#sobre'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
end
