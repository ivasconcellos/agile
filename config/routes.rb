Rails.application.routes.draw do

  resources :conversas, except: [:edit]
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
  resources :avatares
  resources :comentarios, except: [:index, :show]
  resources :foruns
  resources :explicacoes
  resources :usuario_curso
  resources :materiais
  resources :cursos
  resources :tema_cursos
  devise_for :admins, :skip => [:registrations]
  
  resources :usuarios, :only => [:index, :edit, :update, :show]
  devise_for :usuarios, :path_prefix => 'my', controllers: {
    sessions: 'usuarios/sessions',
    registrations: 'usuarios/registrations',
  }

  devise_scope :usuario do
    root 'usuarios/sessions#new'
  end

  # root  :to =>'controle/#inicial'
  

  get 'inicial' => 'controle#inicial'
  get 'sobre' => 'controle#sobre'
  get 'controle_gestor' => 'controle#controle_gestor'
  get 'controle_professor' => 'controle#controle_professor'
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
  get 'termo_compromisso' => 'usuarios#termo_compromisso'
  get 'equipe' => 'grupos_cursos#lista_participantes'
  get 'conversas_professor' => 'conversas#conversas_professor'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'

  mount ActionCable.server => '/cable'
  
end
