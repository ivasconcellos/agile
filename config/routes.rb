Rails.application.routes.draw do

  resources :aluno_respostas, except: [:index]
  resources :dicas, except: [:index]
  resources :artefatos_alunos, except: [:show, :edit, :destroy]
  resources :eventos
  resources :badges_alunos, except: [:show, :edit, :destroy]
  resources :conversas, except: [:edit]
  resources :grupos_cursos
  resources :artefatos
  resources :grupos
  resources :respostas_perguntas
  resources :perguntas_quiz, except: [:index]
  resources :quizes, except: [:index]
  resources :niveis
  resources :missoes
  resources :badges
  resources :salas_chat
  resources :avaliacao_tarefa, except: [:index]
  resources :tarefa_alunos
  resources :tarefas, except: [:index]
  resources :modulos
  resources :avatares
  resources :comentarios, except: [:index, :show]
  resources :foruns
  resources :explicacoes, except: [:index]
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

  #Controle
  get 'inicial' => 'controle#inicial'
  get 'sobre' => 'controle#sobre'
  get 'controle_gestor' => 'controle#controle_gestor'
  get 'controle_professor' => 'controle#controle_professor'
  get 'desenvolvimento' => 'controle#desenvolvimento'
  get 'curso_atual' => 'cursos#atualizar_curso_atual'

  #Usuário Curso
  get 'busca_curso' => 'usuario_curso#busca_curso'
  get 'inscricao_curso' => 'usuario_curso#inscricao_curso'
  get 'notas_aluno' => 'usuario_curso#notas_aluno'
  get 'minhas_notas' => 'usuario_curso#minhas_notas'
  get 'atualizar_avatar' => 'usuario_curso#atualizar_avatar'
  
  #Curso
  get 'descricao' => 'cursos#descricao'
  get 'notas' => 'cursos#notas'

  get 'material_texto' => 'materiais#texto'
  
  get 'termo_compromisso' => 'usuarios#termo_compromisso'

  get 'equipe' => 'grupos_cursos#lista_participantes'

  get 'resultado_final_quiz' => 'aluno_respostas#resultado_final_quiz'
  #Conversas
  get 'conversas_professor' => 'conversas#conversas_professor'
  get 'conversas_assunto' => 'conversas#conversas_assunto'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ckeditor::Engine => '/ckeditor'

  mount ActionCable.server => '/cable'
  
  mount Rapidfire::Engine => "/rapidfire"
  
  resources :question_groups do
    get 'results', on: :member

    resources :questions
    resources :answer_groups, only: [:new, :create, :show]
  end
  resources :questions
end
