Rails.application.routes.draw do

  resources :grupos_cursos
  resources :artefatos
  resources :grupos
  resources :respostas_perguntas
  resources :perguntas_quiz
  resources :quizes
  resources :niveis
  resources :missoes
  resources :badges
  resources :salas_chat
  resources :avaliacao_tarefa
  resources :tarefa_alunos
  resources :tarefas
  resources :modulos
  resources :avatares, :except => :index
  resources :comentarios
  resources :foruns
  resources :explicacoes
  resources :usuario_curso
  resources :materiais
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
  get 'inscricao_curso' => 'usuario_curso#inscricao_curso'
  get 'descricao' => 'cursos#descricao'
  get 'material_texto' => 'materiais#texto'
  get 'meu_perfil' => 'usuario_curso#meu_perfil'
  get 'visualizar_respostas' => 'tarefas#visualizar_respostas'
  get 'minhas_notas' => 'usuarios#minhas_notas'
  get 'notas_aluno' => 'usuarios#notas_aluno'
  get 'notas' => 'cursos#notas'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'

  mount ActionCable.server => '/cable'
  
end
