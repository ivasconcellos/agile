Rails.application.routes.draw do

  resources :tarefa_alunos
  resources :tarefas
  resources :avatares
  resources :comentarios
  resources :foruns
  resources :explicacoes
  resources :usuario_curso
  resources :materiais
  resources :conteudos
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
  get 'desenvolvimento' => 'controle#desenvolvimento'
  get 'curso_atual' => 'cursos#atualizar_curso_atual'
  get 'busca_curso' => 'usuario_curso#busca_curso'
  get 'descricao' => 'cursos#descricao'
  get 'material_texto' => 'materiais#texto'
  get 'meu_perfil' => 'usuario_curso#meu_perfil'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'
  
end
