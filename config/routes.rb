Rails.application.routes.draw do

  resources :areas
  resources :notificacoes, only: [:index]
  resources :recompensas
  resources :faqs
  resources :dialogos, except: [:index]
  resources :comunicados
  resources :quiz_respostas_alunos, except: [:index]
  resources :dicas, except: [:index]
  resources :artefatos_alunos, except: [:show, :edit, :destroy]
  resources :eventos
  resources :badges_alunos, except: [:show, :edit, :destroy]
  resources :conversas, except: [:edit]
  resources :grupos_cursos
  resources :artefatos
  resources :grupos
  resources :quiz_pergunta_respostas
  resources :quiz_perguntas, except: [:index]
  resources :quizzes, except: [:index]
  resources :niveis
  resources :missoes, except: [:index]
  resources :badges
  resources :salas_chat
  resources :tarefa_avaliacao, except: [:index]
  resources :tarefa_alunos
  resources :tarefas, except: [:index]
  resources :avatares
  resources :foruns_comentarios, except: [:index, :show]
  resources :foruns
  resources :usuario_curso
  resources :materiais, except: [:index]
  resources :cursos
  resources :ahoy_visits, except: [:new, :edit, :destroy]

  resources :modulos do
    collection do
      patch :sort
    end
  end

  resources :modulos_ordenacoes do
    collection do
      patch :sort
    end
  end
  

  resources :tema_cursos
  devise_for :admins, :skip => [:registrations]

  devise_scope :admin do
    authenticated :admin do
      root 'controle#controle_gestor', as: :authenticated_root
    end
  end
  
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
  get 'contato' => 'controle#contato'

  #Usuário Curso
  get 'busca_curso' => 'usuario_curso#busca_curso'
  get 'inscricao_curso' => 'usuario_curso#inscricao_curso'
  get 'notas_aluno' => 'usuario_curso#notas_aluno'
  get 'minhas_notas' => 'usuario_curso#minhas_notas'
  get 'ranking_usuario' => 'usuario_curso#ranking_usuario'
  get 'escolher_equipe' => 'usuario_curso#escolher_equipe'
  get 'cancelar_inscricao' => 'usuario_curso#cancelar_inscricao'
  get 'finalizar_curso' => 'usuario_curso#finalizar_curso'
  get 'atualizar_avatar' => 'usuario_curso#atualizar_avatar'
  get 'pendencias' => 'usuario_curso#pendencias'
  get 'minhas_conquistas' => 'usuario_curso#minhas_conquistas'
  get 'nota_total_alunos' => 'usuario_curso#nota_total_alunos'
 
  #Curso
  get 'curso_atual' => 'cursos#atualizar_curso_atual'
  get 'descricao' => 'cursos#descricao'
  get 'visualizar_curso' => 'cursos#visualizar_curso'
  get 'notas' => 'cursos#notas'
  get 'enviar_convite' => 'cursos#enviar_convite'
  post 'enviar_convite' => 'cursos#enviar_convite'
  
  get 'finalizar_completamente_curso' => 'cursos#finalizar_completamente_curso'

  get 'material_texto' => 'materiais#texto'
  
  get 'termo_uso' => 'usuarios#termo_uso'

  get 'equipe' => 'grupos_cursos#lista_participantes'

  get 'resultado_final_quiz' => 'quiz_respostas_alunos#resultado_final_quiz'

  get 'finalizar_quiz' => 'quizzes#finalizar_quiz'

  get 'graficos_pizza' => 'question_groups#graficos_pizza'

  get 'graficos_barra' => 'question_groups#graficos_barra'

  get 'faq_agile' => 'faqs#faq_agile'

  get 'faq_agile' => 'faqs#faq_agile'

  get 'visualizar_avatares' => 'avatares#visualizar_avatares'

  get 'tarefas_avaliar' => 'tarefa_avaliacao#tarefas_avaliar'

  #Conversas
  get 'conversas_professor' => 'conversas#conversas_professor'
  get 'conversas_assunto' => 'conversas#conversas_assunto'

  get 'cancelar_evento' => 'eventos#cancelar_evento'

  #CursoCertificado
  get 'gerar_certificado' => 'curso_certificados#gerar_certificado'
  get 'validar_certificado' => 'curso_certificados#validar_certificado'
  get 'certificado_validado' => 'curso_certificados#certificado_validado'

  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
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
